//
//  CustomView.swift
//  Delegate
//
//  Created by okkoung on 2017. 10. 12..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class CustomView: UIView {
  @IBOutlet var titleLB: UILabel!
  var delegate:CustomViewDelegate?
  override func awakeFromNib() {
    super.awakeFromNib()
    
    
  }
  func changeText(newText: String){
    titleLB.text = newText
  }
  @IBAction func btnAction(_ sender: UIButton){
    delegate?.didSelectedCustomView(self)
  }
}

protocol CustomViewDelegate {
  func didSelectedCustomView(_ customView:CustomView)
}
