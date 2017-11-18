
import Foundation
import UIKit

struct WeatherCenter {
  
  static var center: WeatherCenter = WeatherCenter()
  
  let baseUrl = "https://api.openweathermap.org/data/2.5"
  let sesson = URLSession.shared
  let subUrl = "/weather"
  let myAppKey = "01b397765c6f6ad4905910fa6c3a78a0"
  
  
  func weatherCurrent(lat: Double, lon: Double, completion: @escaping (_ isSuccess: Bool, _ data: Any?) -> Void) {
    
    let url = URL(string: baseUrl + subUrl + "?lat=\(lat)" + "&lon=\(lon)" + "01b397765c6f6ad4905910fa6c3a78a0")
//    let urlRequest = URLRequest(url: url!)
    sesson.dataTask(with: url!) { (data, response, error) in
      if error != nil {
        print("\(String(describing: error))server fail")
      } else if (response as! HTTPURLResponse).statusCode == 200 {
        let jsonDic = try! JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
        completion(true, jsonDic)
      } else {
        completion(false, nil)
      }
        
      }
    }
    
  }
