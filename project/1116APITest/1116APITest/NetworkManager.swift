
import Foundation
import UIKit

let baseUrl = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"
let urlSignup = "/member/signup/"
let urlLogin = "/member/login/"
let urlPost = "/post/"

class NetworkManager {
  
  static var shard: NetworkManager = NetworkManager()
  let session = URLSession.shared
  
  typealias Completion = (_ isSucess: Bool, _ returnValue: Any?, _ error: Error?) -> Void
  var token: String?
  
  
  private init(){
    loadToken()
  }
  
  func requestSignup(userid: String, password: String, completion: @escaping Completion) {
    let url = URL(string: baseUrl + urlSignup)
    var request = URLRequest(url: url!)
    request. = "POST"
    
    let dataStr = "username=\(userid)&password1=\(password)&password2=\(password)"
    //    "{username:\(userid), password1:\(password), password2:\(password)}"
    
    request.httpBody = dataStr.data(using: .utf8)
    
    session.dataTask(with: request) { [unowned self] (data, response, error) in
      
      if error != nil {
        print(error)
        return
      }
      
      let code = (response as! HTTPURLResponse).statusCode
      if code == 201 {
        let resultdic = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: String]
        self.token = resultdic["key"]!
        completion(true, nil, nil)
      } else {
        let resultdic = try! JSONSerialization.jsonObject(with: data!, options: [])
        completion(false, nil, nil)
      }
      }.resume()
  }
  
  //  func requestLogin(userid: String, password: String, completion: @escaping Completion){
  //    var url = URL(string: baseUrl + urlLogin + "?username=\(userid)&password=\(password)",
  //      session.dataTask(with: url, completionHandler: { (data, response, error) in
  //        <#code#>
  //      })
  //  }
  
  func requestGetPosts(completion: @escaping Completion)
  {
    // guard let token = NetworkManager.shard.token else { return }
    let url = URL(string: baseUrl + urlPost)
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    request.addValue("Token 3ae4c36b283c8d295bacf7c82056888561abcd59", forHTTPHeaderField: "Authorization")
    
    session.dataTask(with: request) { (data, response, error) in
      if let error = error {
        completion(false, nil, nil)
      }
      let code = (response as! HTTPURLResponse).statusCode
      if code  == 200 {
        
        let decoder = JSONDecoder()
        let model = try! decoder.decode([PostModel].self, from: data!)
        
        print("200")
        let resultDic = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]
        completion(true, nil, nil)
        print(resultDic)
      } else {
        completion(false, nil, nil)
      }
      }.resume()
    
  }
  
  func requestPost(post:PostModel, img: UIImage, completion: Completion) {
    let url = URL(string: baseUrl + urlPost)
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    request.addValue("Token 3ae4c36b283c8d295bacf7c82056888561abcd59", forHTTPHeaderField: "Authorization")
    let boundary = "Boundary-\(UUID().uuidString)"
    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    
    let fileName = String(Date().timeIntervalSince1970) + ".jpeg"
    let body = createBody(parameters: ["title": post.title, "content": post.content!],
                          boundary: boundary,
                          data: UIImageJPEGRepresentation(img, 0.5)!,
                          dataType: "img_cover",
                          mimeType: "image/jpeg",
                          filename: fileName)
    request.httpBody = body
    
  }
  func saveToken(){
    if let token = token {
      UserDefaults.standard.set(token, forKey: "TokenKey")
    }
  }
  
  func loadToken(){
    if let token = UserDefaults.standard.string(forKey: "TokenKey"){
      self.token = token
    }
    
  }
  
  private func createBody(parameters: [String: String],
                          boundary: String,
                          data: Data,
                          dataType: String,
                          mimeType: String,
                          filename: String) -> Data {
    var body = Data()
    let boundaryPrefix = "--\(boundary)\r\n"
    for (key, value) in parameters {
      body.appendString(boundaryPrefix)
      body.appendString("Content-Disposition: form-data; name=\"\(key)\"")
      body.appendString("\r\n")
      body.appendString("\r\n")
      body.appendString("\(value)")
      body.appendString("\r\n")
    }
    body.appendString(boundaryPrefix)
    body.appendString("Content-Disposition: form-data: name=\"\(dataType)\"; filename=\"\(filename)\"")
    body.appendString("\r\n")
    body.appendString("Content-Type: \(mimeType)")
    body.appendString("\r\n")
    body.appendString("\r\n")
    body.append(data)
    body.appendString("\r\n")
    
    body.appendString("--\(boundary)--")
    return body
  }
  
}
extension Data {
  mutating func appendString(_ string: String) {
    let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
    append(data!)
  }
}



