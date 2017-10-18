//
//  CustomView.swift
//  delegateTest
//
//  Created by okkoung on 2017. 10. 12..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit


protocol CustomViewDelegate {
  func didSwitchSelected(_ customview:CustomView)
}

class CustomView: UIView {
  

  @IBOutlet var titleLB: UILabel!
  @IBOutlet var img: UIImageView!
  var delegate: CustomViewDelegate?

  
  override func awakeFromNib() {
    super.awakeFromNib()
  
    let currentImg = UIImage(named: "intro_img")!
    img.image = currentImg
    img.contentMode = .scaleAspectFit
  }
  
  @IBAction func thisisswitch(_ sender: UISwitch){
    if sender.isOn {
      delegate?.didSwitchSelected(self)
    }
    
   
  }
  
  
  func titleLBChange(newText:String){
    titleLB.text = newText
  }
  func imgChange(newImg: UIImage){
    img.image = newImg
  }
}

