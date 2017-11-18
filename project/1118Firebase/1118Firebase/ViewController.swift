
import UIKit
import Firebase

class ViewController: UIViewController{
  
//  database를 쓰려면 basic 하게 써줘야함 
  var ref: DatabaseReference!

  @IBOutlet weak var idTF: UITextField!
  @IBOutlet weak var passTF: UITextField!
  @IBOutlet weak var deleteTF: UITextField!
  @IBOutlet weak var selectedTF: UITextField!
  
  @IBOutlet weak var resultTf: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ref = Database.database().reference()
    
    ref.observe(.childAdded) { (dataSnapShots) in
      print("ok")
    }
  }

  @IBAction func didTabInsertBtn(_ sender: UIButton) {
    let itemsRef = ref.child((idTF.text?.lowercased())!)
    itemsRef.setValue(passTF.text)
    
    idTF.text = ""
    passTF.text = ""
  }
  
  @IBAction func didTabDeleteBtn(_ sender: UIButton) {
    let itemRef = ref.child(deleteTF.text!)
    itemRef.removeValue()
  }
  
  @IBAction func didTabSelectedBtn(_ sender: UIButton) {
    let itemRef = ref.child(selectedTF.text!)
    
  }
}

