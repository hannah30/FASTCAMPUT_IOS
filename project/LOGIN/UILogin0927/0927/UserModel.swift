//
//  UserModel.swift
//  0927
//
//  Created by okkoung on 2017. 9. 27..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

final class UserModel {
  
  var model: [User] = [User(username: "choi", password:"1234"),
                       User(username: "hannah", password:"1234"),
                       User(username: "me", password:"1234"),
                       ]
  struct User {
    var username: String
    var password: String
  }
  
  func findUser(name: String, password: String) -> Bool{
    for user in model {
      if user.username == name && user.password == password{
        return true
      }
    }
    return false
  }
  
  func addUser(name: String, password: String){
    let newUser = User(username: name, password: password)
    model.append(newUser)
  }
  
}
