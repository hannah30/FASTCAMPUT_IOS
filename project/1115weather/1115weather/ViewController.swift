
import UIKit
import CoreLocation

//37.517439, 127.018498

class ViewController: UIViewController, CLLocationManagerDelegate {
  
  @IBOutlet weak var todayWeatherCondition: UILabel!
//  @IBOutlet weak var todayWeatherIcon: UILabel!
  @IBOutlet weak var todayWeatherTemp: UILabel!
  @IBOutlet weak var todayWeatherTempMax: UILabel!
  @IBOutlet weak var todayWeatherTempMin: UILabel!
  
  @IBOutlet weak var weatherIcon: UIImageView!
  
  var weatherAllimy: WeatherModel?
//  내핸폰의 현재 위치를 구하기 위한 변수들
  lazy var locationManager = CLLocationManager()
  var lati: Double = 0
  var longi: Double = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
// 내핸폰의 현재위치 찾기 -  by 강사님
    locationManager.requestWhenInUseAuthorization()
    locationManager.delegate = self
    locationManager.startUpdatingLocation()
    
//    fetch()
    WeatherCenter.center.weatherCurrent(lat: lati, lon: longi) { (bool, dic) in
      self.weatherAllimy = WeatherModel(json: dic as! [String : Any])
      DispatchQueue.main.async {
        guard let weatherInfo = self.weatherAllimy else { return }
        self.todayWeatherCondition.text = weatherInfo.todayWeather
        //          self.todayWeatherIcon.text = weatherInfo.icon
        let imageURL = URL(string: "http://openweathermap.org/img/w/\(weatherInfo.icon).png")!
        self.weatherIcon.setImageFromURL(with: imageURL)
        self.todayWeatherTemp.text = "\("현재온도 : " + String(Int(weatherInfo.temperature - 273.15)) + "˚")"
        self.todayWeatherTempMin.text = "\("최저온도 : " + String(Int(weatherInfo.tempMin - 273.15)) + "˚")"
        self.todayWeatherTempMax.text = "\("최고온도 : " + String(Int(weatherInfo.tempMax - 273.15)) + "˚")"
      }
    }
    
  }
  
//  내핸폰이 움직인 마지막 위치를 찾는 메서드를 위도&경도 변수에 넣어줌
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    locationManager.stopUpdatingLocation()
    print(locations.last!)
    guard let locationCoordinate = locations.last?.coordinate else { return }
    
    self.lati = Double(locationCoordinate.latitude)
    self.longi = Double(locationCoordinate.longitude)
    
    fetch()
  }
  
//  데이터 네트워크 하는 곳
  
  func fetch() {
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?APPID=01b397765c6f6ad4905910fa6c3a78a0&lat=\(lati)&lon=\(longi)")!
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    
    let session = URLSession(configuration: .default)
    session.dataTask(
    with: urlRequest) { [weak self] (data, response, error) in
      guard let `self` = self else { return }
      if error == nil {
        let jsonData = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
        self.weatherAllimy = WeatherModel(json: jsonData)
        
// 데이터를 받아오는 시간이 일정치 않으므로 UI는 DispatchQueue에서 main에서 처리해주게 한다
        DispatchQueue.main.async {
          guard let weatherInfo = self.weatherAllimy else { return }
          self.todayWeatherCondition.text = weatherInfo.todayWeather
//          self.todayWeatherIcon.text = weatherInfo.icon
          let imageURL = URL(string: "http://openweathermap.org/img/w/\(weatherInfo.icon).png")!
          self.weatherIcon.setImageFromURL(with: imageURL)
          self.todayWeatherTemp.text = "\("현재온도 : " + String(Int(weatherInfo.temperature - 273.15)) + "˚")"
          self.todayWeatherTempMin.text = "\("최저온도 : " + String(Int(weatherInfo.tempMin - 273.15)) + "˚")"
          self.todayWeatherTempMax.text = "\("최고온도 : " + String(Int(weatherInfo.tempMax - 273.15)) + "˚")"
        }
        
        print(self.weatherAllimy!)
      }
      }.resume()
  
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

