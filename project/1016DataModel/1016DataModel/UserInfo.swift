//
//  UserInfo.swift
//  1016DataModel
//
//  Created by okkoung on 2017. 10. 16..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

struct UserInfo {
  var userID: String
  var userPW: String
  var email: String
  var birthDay: String?
  var gender:Gender?
  
  init?(userDic:[String: Any]){
    guard let userID = userDic["userID"] as? String else{return nil}
    self.userID = userID
    guard let userPW = userDic["userPW"] as? String else{return nil}
    self.userPW = userPW
    guard let email = userDic["email"] as? String else{return nil}
    self.email = email
    
    self.birthDay = userDic["birthDay"] as? String
    if let genderData = userDic["gender"] as? Int, genderData == 1 || genderData == 2 {
      self.gender = Gender(rawValue:genderData)
    }
  }
}
