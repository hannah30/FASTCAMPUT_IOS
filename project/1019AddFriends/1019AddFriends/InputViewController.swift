

import UIKit

class InputViewController: UIViewController {
  @IBOutlet var tf: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func saveBtnHandeler(_ sender: UIButton) {
    let name = tf.text ?? ""
    DataCenter.mainCenter.addName(name)
    self.navigationController?.popViewController(animated: true)
  }


}
