//
//  MyCustomCell.swift
//  UITableViewPractice
//
//  Created by okkoung on 2017. 9. 29..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    createView()
    
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  var img: UIImageView?
  var lb: UILabel?
  override func layoutSubviews() {
    super.layoutSubviews()
    layoutImg()
  }
  func createView(){
    img = UIImageView()
    self.addSubview(img!)
    lb = UILabel()
    self.addSubview(lb!)
  }
  func setImg(name: String){
    img?.image = UIImage(named: name)
  }
  func layoutImg(){
    img?.frame = CGRect(x: 20, y: 40, width: 100, height: 60)
    lb?.frame = CGRect(x: 130, y: 20, width: 100, height: 100)

  }

}
