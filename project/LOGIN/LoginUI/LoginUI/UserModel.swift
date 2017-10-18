

import Foundation

final class UserModel {

  var model: [User] = [
    User(username: "okkoung", password: "1234"),
    User(username: "choi", password: "1234"),
  ]
  struct User {
    var username: String
    var password: String
  }
  
  @objc func findUser(name: String, password: String) -> Bool {
    for user in model {
      if user.username == name && user.password == password{
        print("success")
        return true
      }
    }
    return false
  }
  
  @objc func addUser(name: String, password: String){
    let newUser = User(username: name, password: password)
    model.append(newUser)
  }
}
