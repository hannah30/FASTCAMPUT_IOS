//
//  DataCenter.swift
//  1017DataModel2
//
//  Created by okkoung on 2017. 10. 19..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

class DataCenter {
  static var main: DataCenter = DataCenter()
  
  func loadUserData() {
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/UserPlist.plist"
    print(path)
  }
  
  func write(userData data: AlbumModel) {
    
    
  }
}
