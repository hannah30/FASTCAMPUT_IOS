//
//  KeringLabel.swift
//  0927
//
//  Created by okkoung on 2017. 9. 27..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

@IBDesignable

class KeringLabel: UILabel {

  @IBInspectable var kerning:CGFloat = 0.0{
    didSet {
      if ((self.attributedText?.length) != nil) {
        let attribString = NSMutableAttributedString(attributedString: self.attributedText!)
        attribString.addAttributes([NSKernAttributeName:kerning], range:NSMakeRange(0, self.attributedText!.length))
        self.attributedText = attribString
      }
    }
  }

}
