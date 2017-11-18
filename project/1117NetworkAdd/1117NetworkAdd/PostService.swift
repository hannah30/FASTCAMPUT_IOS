
import Foundation

struct PostService {
  
  static func fetchPosts(completion: @escaping (Bool) -> Void){
    
    let url = URL(string: "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api")
    var urlRequest = URLRequest(url: url!)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("Token 3ae4c36b283c8d295bacf7c82056888561abcd59", forHTTPHeaderField: "Authorization")
    
    let session = URLSession.shared
    let task = session.dataTask(with: urlRequest) { (data, response, error) in
      if error != nil {
        completion(false)
        return
      }
      let statusCode = (response as! HTTPURLResponse).statusCode
      switch
    }
    task.resume()
  }
}
