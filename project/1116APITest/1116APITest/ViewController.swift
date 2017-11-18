
import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var idTF: UITextField!
  @IBOutlet weak var passTF: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func didTabAccout(_ sender: UIButton) {
    if checkData(){
      
      guard let userId = idTF.text else {return}
      guard let userPass = passTF.text else {return}
      
      NetworkManager.shard.requestSignup(userid: userId, password: userPass, completion: { (isSuccess, _, _) in
        if isSuccess == true {
          self.performSegue(withIdentifier: "List", sender: nil)
        } else {
          let arlet = UIAlertController(title: "아이디&패스워드확인", message: "아이디와 패스워드를 확인해주세요.", preferredStyle: .alert)
          let arletAction = UIAlertAction(title: "확인", style: .default, handler: nil)
          arlet.addAction(arletAction)
          self.present(arlet, animated: true, completion: nil)
        }
      })
      
    }
  }
  func checkData() -> Bool {
    //아이디검사
    //비밀번호 검사
    return true
  }
  

  @IBAction func didTabLogin(_ sender: UIButton) {
   
    guard let userId = idTF.text, !userId.isEmpty else {return}
    guard let userPass = passTF.text, !userPass.isEmpty else {return}
    
    
    }
    
  }
  
  


