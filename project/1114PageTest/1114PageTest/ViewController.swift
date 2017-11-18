//
//  ViewController.swift
//  1114PageTest
//
//  Created by okkoung on 2017. 11. 14..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit
import PagingKit

class ViewController: UIViewController {
 
  var menuViewController: PagingMenuViewController!
  var contentViewController: PagingContentViewController!
  var first: firstViewController = firstViewController()
//  static var viewController: (UIColor) -> UIViewController = { (color) in
//    let vc = UIViewController()
//    vc.view.backgroundColor = color
//    return vc
//  }
  
//  var dataSource = [(menuTitle: "뉴스", vc: first, (menuTitle: "출석", vc: viewController(.blue)), (menuTitle: "일정", vc: viewController(.yellow)), (menuTitle: "더보기", vc: viewController(.purple))]
  var contentDatasource: [(menuTitle: String, vc: UIViewController)]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViewController()
    
    menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
    menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
  
    menuViewController.reloadData(with: 0)
    contentViewController.reloadData(with: 0)
    
  }
  
  func setupViewController() {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let vc1 = mainStoryboard.instantiateViewController(withIdentifier: "1")
    let vc2 = mainStoryboard.instantiateViewController(withIdentifier: "2")
    let vc3 = mainStoryboard.instantiateViewController(withIdentifier: "3")
    let vc4 = mainStoryboard.instantiateViewController(withIdentifier: "4")
    
    contentDatasource = [
      (menuTitle: "1", vc: vc1),
      (menuTitle: "2", vc: vc2),
      (menuTitle: "3", vc: vc3),
      (menuTitle: "4", vc: vc4),
    ]
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? PagingMenuViewController {
      menuViewController = vc
      menuViewController.dataSource = self
      menuViewController.delegate = self
    } else if let vc = segue.destination as? PagingContentViewController {
      contentViewController = vc
      contentViewController.dataSource = self
      contentViewController.delegate = self
    }
  }

}

extension ViewController: PagingMenuViewControllerDataSource {
  func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
    return contentDatasource?.count ?? 0
  }
  
  func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
    return self.view.bounds.size.width / CGFloat(contentDatasource?.count ?? 1)
  }
  
  func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
    let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
    cell.titleLabel.text = contentDatasource?[index].menuTitle
    return cell
  }
}

extension ViewController: PagingContentViewControllerDataSource {
  func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
    return contentDatasource?.count ?? 0
  }
  
  func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
    return contentDatasource![index].vc
  }
}

extension ViewController: PagingMenuViewControllerDelegate {
  func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
    contentViewController.scroll(to: page, animated: true)
  }
}

extension ViewController: PagingContentViewControllerDelegate {
  func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
    menuViewController.scroll(index: index, percent: percent, animated: false)
  }
}
