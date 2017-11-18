
import Foundation

struct WeatherModel {
  
  let todayWeather: String
  let icon: String
  let temperature: Double
  let tempMin: Double
  let tempMax: Double
  
  init?(json: [String: Any]) {
    guard let data = json["weather"] as? [[String: Any]],
      let resultData = data.first
    else { return nil }
    self.todayWeather = resultData["main"] as! String
    self.icon = resultData["icon"] as! String
    guard let mainData = json["main"] as? [String: Any] else { return nil }
    self.temperature = mainData["temp"] as! Double
    self.tempMin = mainData["temp_min"] as! Double
    self.tempMax = mainData["temp_max"] as! Double
  }
}
