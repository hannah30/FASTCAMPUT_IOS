//
//  ViewController.swift
//  ViewTest
//
//  Created by okkoung on 2017. 9. 25..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var subview: UIView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let subview: UIView = UIView(frame: CGRect(x: 15, y: 15, width: 345, height: 100))

    subview.backgroundColor = UIColor.blue
    self.view.addSubview(subview)
    
    
    let anotherView: UIView = UIView(frame: CGRect(x: 15, y: self.view.frame.size.height - 115, width: 345, height: 100))
    anotherView.backgroundColor = UIColor.cyan
    self.view.addSubview(anotherView)
    
    let one : UIView = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
    one.layer.cornerRadius = 30
    one.layer.borderWidth = 2
    one.layer.borderColor = UIColor.red.cgColor
 
    
    one.backgroundColor = UIColor.brown
    self.view.addSubview(one)
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  
    subview.frame = CGRect(x: 15, y: 15, width: self.view.frame.size.width - 30, height: 100)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func configureLayerProperty(label: UILabel) {
    label.layer.cornerRadius = 5
    label.layer.borderColor = UIColor.white.cgColor
  }

}

