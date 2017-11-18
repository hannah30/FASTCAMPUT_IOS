import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
  
 @IBOutlet weak var mapview: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let coordinate = CLLocationCoordinate2D(latitude: 37.497948, longitude: 127.027563)
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    mapview.setRegion(region, animated: false)
    
    let manager = CLLocationManager()
    manager.delegate = self
    manager.requestAlwaysAuthorization()
    manager.requestWhenInUseAuthorization()
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.startUpdatingLocation()
  }
 
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}



