//
//  profilDataModel.swift
//  1019tTbleView
//
//  Created by okkoung on 2017. 10. 20..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

struct ProfileModel {

  var nickName: String
  var statusDesc: String
  var profileImg: String
  
  var email: String
  var phoneNum: String
  var myProfiledesc: String
  var backgroundImg: String
  
  init? (data: [String: String]) {
    guard let nickName = data["Nickname"] else { return nil}
    self.nickName = nickName
    guard let statusDesc = data["StatusDescription"] else { return nil}
    self.statusDesc = statusDesc
    guard let profileImg = data["ProfileImage"] else { return nil}
    self.profileImg = profileImg
    guard let email = data["Email"] else { return nil}
    self.email = email
    guard let phoneNum = data["PhoneNumber"] else { return nil}
    self.phoneNum = phoneNum
    guard let myProfiledesc = data["MyProfileDescription"] else { return nil}
    self.myProfiledesc = myProfiledesc
    guard let backgroundImg = data["BackgroundImage"] else { return nil}
    self.backgroundImg = backgroundImg
  }
  
}

