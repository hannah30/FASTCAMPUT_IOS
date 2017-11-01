
import UIKit

class CustomView: UIView {
  
  @IBOutlet weak var pushBtn : UIButton!
  var didTabclosure: ((String) -> Void)?
  
  @IBAction func didTab() {
    didTabclosure?("dddddd")
  }
}
