
import Foundation

struct User: Codable {
  
  let username: String
  var email: String
  var password: String

  
//  init? (dictionary: [String: Any]) {
//    guard let username = dictionary["username"] as? String else { return nil }
//    self.username = username
//    guard let email = dictionary["email"] as? String else { return nil }
//    self.email = email
//    guard let password = dictionary["password"] as? String else { return nil }
//    self.password = password
//  }
}

struct Users: Codable {
  
  var users: [User]
//  init(dictionary:[String: Any]) {
//    guard let users = dictionary["item"] as? [[String: Any]] else { return }
//
//    for user in users {
//      self.users.append(User(dictionary: user)!)
//
//    }
//
//  }
}
