//
//  RoundButton.swift
//  0927
//
//  Created by okkoung on 2017. 9. 27..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {
//인터페이스 빌더에서 추적이 가능하다는 의미
  @IBInspectable var radius: CGFloat = 0{
    didSet{
      self.layer.cornerRadius = radius
    }
  }
  
  
}
