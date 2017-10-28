//
//  CustomTextfield.swift
//  1018MakeAccoutTest
//
//  Created by okkoung on 2017. 10. 18..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class CustomTextfield: UITextField {
  
//텍스트필드의 왼쪽 이미지뷰의 사이즈를 CGRect 로 주는 메서드
  override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    let leftViewWidth = self.bounds.size.height / 2
    let resultRect = CGRect(
      x: 10,
      y: (self.bounds.size.height / 2) - (leftViewWidth / 2) ,
      width: leftViewWidth - 15,
      height: leftViewWidth - 5
    )
    
    return resultRect
  }
  //placeholder에 패딩값 주는 법
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, (self.bounds.size.height / 2) + 5, 0, 0))
  }
  
//  //placeholder 에 패딩값을 주면 텍스트필드에도 동일한 값을 줘야 같은 위치에 보인다
//  override func textRect(forBounds bounds: CGRect) -> CGRect {
//    return UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, (self.bounds.size.height / 2) + 5, 0, 0))
//  }
//
  //placeholder안의 텍스트에 컬러를 입히고 싶을때
  func configureAttributedString(
    string:String,
    range: NSRange,
    stringColor: UIColor
    ){
    let attributedString = NSMutableAttributedString(string: string)
    attributedString.addAttribute(
      NSAttributedStringKey.foregroundColor,
      value: stringColor,
      range: range
    )
    self.attributedPlaceholder = attributedString
  }
  
}
