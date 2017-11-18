
import UIKit
import Foundation

extension UIImageView {
  
  func setImageFromURL(with url: URL) {
    
    let urlRequest = URLRequest(url: url)
    let session = URLSession(configuration: .default)
    
    let dataTask = session.dataTask(
    with: urlRequest) { (data, response, error) in
      
      if error != nil {
        print(error!)
        return
      }
      
      let image = UIImage(data: data!)!
      DispatchQueue.main.async {
        self.image = image
      }
      
    }
    dataTask.resume()
    
  }
}
