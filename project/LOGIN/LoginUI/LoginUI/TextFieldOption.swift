

import UIKit

class TextFieldOption: UITextField {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.layer.cornerRadius = 10
//    self.layer.backgroundColor = UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0).cgColor
//    self.layerr.frame.size.height = 56
//    self.font = UIFont(name: "Helvetica", size: 17)
  

  }
  
//  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//    let paddingInsets = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0)
//    return UIEdgeInsetsInsetRect(self.bounds, paddingInsets)
//  }
//  
//  override func textRect(forBounds bounds: CGRect) -> CGRect {
//    let paddingInsets = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0)
//    return UIEdgeInsetsInsetRect(self.bounds, paddingInsets)
//  }
//  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let paddingInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    return UIEdgeInsetsInsetRect(self.bounds, paddingInsets)
  }

}
