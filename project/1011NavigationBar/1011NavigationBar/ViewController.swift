//
//  ViewController.swift
//  1011NavigationBar
//
//  Created by okkoung on 2017. 10. 11..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let img:UIImage = UIImage(named: "icon_list")!
  override func viewDidLoad() {
    super.viewDidLoad()
    let nextBtn: UIButton = UIButton()
//    nextBtn.setTitle("Next", for: .normal)
     nextBtn.setImage(img, for: .normal)
    nextBtn.imageView?.contentMode = .scaleAspectFit
   
//    nextBtn.frame = CGRect(x: 0, y: 0, width: 10, height: 40)
    nextBtn.addTarget(self, action: #selector(self.nextBtnHandler(_:)), for: .touchUpInside)
    nextBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    nextBtn.backgroundColor = .green
    

//    let imgView = UIImageView(image: img)
    
//    let tapGesture = UITapGestureRecognizer(target: <#T##Any?#>, action: <#T##Selector?#>)
//    imgView.addGestureRecognizer(tapGesture)
    self.navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: nextBtn)
    

  }
  @objc func nextBtnHandler(_ sender:UIButton){
    goToNextVC()
    
  }
  private func goToNextVC(){
    let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    self.navigationController?.pushViewController(nextVC, animated: true)
    
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
//push하는 법, pop도 동일함, navigationController에게 요청해야함
//  func pushAction{
//    let nextVC = UIViewController()
//    self.navigationController?.pushViewController(nextVC, animated: true)
//  }
}

