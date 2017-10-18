//
//  ViewController.swift
//  tableView
//
//  Created by okkoung on 2017. 9. 25..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let subview: UIView = UIView()
    subview.frame = .zero
    subview.backgroundColor = .black
    
    view.addSubview(subview)
//    subview.addConstraints([NSLayoutConstraint])
    let top = NSLayoutConstraint(
      item: subview,
      attribute: NSLayoutAttribute.top,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.view,
      attribute: NSLayoutAttribute.top,
      multiplier: 1.0,
      constant: 20
    )
    
    let leading = NSLayoutConstraint(
      item: subview,
      attribute: NSLayoutAttribute.leading,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.view,
      attribute: NSLayoutAttribute.leading,
      multiplier: 1.0,
      constant: 20
    )
    let trailing = NSLayoutConstraint(
      item: subview,
      attribute: NSLayoutAttribute.trailing,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.view,
      attribute: NSLayoutAttribute.trailing,
      multiplier: 1.0,
      constant: 20
    )
    let bottom = NSLayoutConstraint(
      item: subview,
      attribute: NSLayoutAttribute.bottom,
      relatedBy: NSLayoutRelation.equal,
      toItem: self.view,
      attribute: NSLayoutAttribute.bottom,
      multiplier: 1.0,
      constant: 20
    )
    
//    view.addConstraints([top,leading,trailing,bottom])
    NSLayoutConstraint.activate([top,leading,trailing,bottom])
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

