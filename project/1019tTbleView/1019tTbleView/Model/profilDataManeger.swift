//
//  profilDataManeger.swift
//  1019tTbleView
//
//  Created by okkoung on 2017. 10. 20..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

class ProfileDataManager {
  
  private var profiles: [ProfileModel] = []
  //원본 데이터를 손상하지 않고 보호하기 위해 private으로 지정해두고 연산프로퍼티를 새로 만들어둔다.
  var profilesData: [ProfileModel] {
    return profiles
  }
  
  init() {
    loadData()
  }
  
  func loadData() {    
    if let bundulPath = Bundle.main.path(forResource: "FreindInfo", ofType: "plist"),
      let nsArrList = NSArray(contentsOfFile: bundulPath) as? [Any] {
      for data in nsArrList {
        if let realData = data as? [String: String],
          let dataModel = ProfileModel(data: realData){
          profiles.append(dataModel)
        }
      }
    }
  }
}
