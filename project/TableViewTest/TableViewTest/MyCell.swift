//
//  MyCell.swift
//  TableViewTest
//
//  Created by okkoung on 2017. 9. 29..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    createView()
  }
    
    
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  var bgImageView: UIImageView?

  func createView(){
    bgImageView = UIImageView()
    self.addSubview(bgImageView!)
  }
  
  func setImageName(name: String){
    bgImageView?.image = UIImage(named: name)
  }
  
  //레이아웃을 불러올때 모든 레이아웃을 불러오게함
  override func layoutSubviews() {
    super.layoutSubviews()
    updateLayout()
  }
  
  func updateLayout(){
    bgImageView?.frame = self.bounds
  }

}
