//
//  ButtonOption.swift
//  LoginUI
//
//  Created by okkoung on 2017. 9. 27..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

//@IBDesignable

class ButtonOption: UIButton {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.layer.cornerRadius = 28
    self.layer.frame.size.height = 56
    self.layer.backgroundColor = UIColor(red: 253.0 / 255.0, green: 87.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0).cgColor
    self.titleLabel?.font = UIFont(name: "Helvetica", size: 17)!
    self.titleLabel?.textColor = .white
  }

}
