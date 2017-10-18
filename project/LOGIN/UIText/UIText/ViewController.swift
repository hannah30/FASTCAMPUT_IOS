//
//  ViewController.swift
//  UIText
//
//  Created by okkoung on 2017. 9. 25..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let subview : UIView = UIView(frame: CGRect(x: 30, y: 100, width: 300, height: 500))
    subview.backgroundColor = UIColor.black
    view.addSubview(subview)
    
    let img : UIImageView = UIImageView(frame: CGRect(x: 30, y: 200, width: 300, height: 100))
    img.image = UIImage(named: "touring1.jpg")
    img.highlightedImage = UIImage(named: "touring.jpg")
    img.isHighlighted = true
    img.contentMode = UIViewContentMode.scaleAspectFit
    img.animationDuration = 30
    view.addSubview(img)
    
    let label: UILabel = UILabel(frame: CGRect(x: 30, y: 300, width: 300, height: 100))
    label.text = "choi okkoung"
    label.font = UIFont(name: "Avenir-Light", size: 40)
    label.numberOfLines = 2 ///우찌하냐...
//    label.attributedText = "hannah"//너도 안되네;;;
    
    view.addSubview(label)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

