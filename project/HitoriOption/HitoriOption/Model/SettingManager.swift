//
//  SettingManager.swift
//  HitoriOption
//
//  Created by okkoung on 2017. 10. 24..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

class SettingManager {
  var settingData: [SectionDataModel] = []
  
  init() {
    loadData()
  }
  
  func loadData () {
    guard let path = Bundle.main.path(forResource: "Settings", ofType: "plist") else { return }
    if let list = NSArray(contentsOfFile: path) as? [[String:Any]] {
      for data in list {
        settingData.append(SectionDataModel(data: data)!)
      }
    }
    
  }
}

