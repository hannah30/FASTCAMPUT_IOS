

import UIKit

class LoginViewController: UIViewController {
  
  var userModel = UserModel()
  
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var userNameTextFiled: UITextField!
  @IBOutlet weak var loginButton: RoundButton!
  
 
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
      userNameTextFiled.addTarget(self, action: #selector(didTabExit(_:)), for: UIControlEvents.editingDidEndOnExit)
      passwordTextField.addTarget(self, action: #selector(didTabExit(_:)), for: UIControlEvents.editingDidEndOnExit)
      
//      userNameTextFiled.layer.cornerRadius = 10
//      userNameTextFiled.layer.borderColor = UIColor.lightGray.cgColor
//      userNameTextFiled.layer.borderWidth = 1 / UIScreen.main.scale
      
    }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if let nextViewController = segue.destination as? SignupViewController {
      nextViewController.didTaskClosure = {(name: String, password: String) -> Void in
        self.userModel.addUser(name: name, password: password)
        
      }
    }
  }
  
 @objc func didTabExit (_ sender: UITextField){
  if sender === userNameTextFiled {
    passwordTextField.becomeFirstResponder()
    }
  }
  
@IBAction func didTapLoginButton(_ sender: RoundButton) {
    
    guard let userName = userNameTextFiled.text, !userName.isEmpty else{return}
    
    guard let password = passwordTextField.text, !password.isEmpty else{return}
    
    let isLoginSuccess: Bool = findUser(name: userName, password: password)
    
    if isLoginSuccess{
    //화면전환
      //1. 알럿컨트롤러 인스턴스 생성
      let alertController = UIAlertController.init(title: "로그인", message: "로그인하시겠습니까?", preferredStyle: .alert)
      //2. 알럿 액션 인스턴스 생성
      let okAction = UIAlertAction(title: "확인", style: .default, handler: { (alert) in
        print("버튼클릭")
        //확인을 눌렀을때 다음 띄울 창
        let main = MainViewController()
        self.present(main, animated: true, completion: nil)

      })
      let cancel = UIAlertAction(title: "취소", style: .destructive, handler: { (alret) in
        print("cancel")
      })
      let how = UIAlertAction(title: "how", style: .destructive, handler: { (alret) in
        print("how")
      })
      
      //3. 알럿 액션 추가
      alertController.addAction(okAction)
      alertController.addAction(cancel)
      alertController.addAction(how)

      
      //4. present(화면전환)
      self.present(alertController, animated: true, completion: nil)
      
      
      
    }else{
//      userNameTextFiled.backgroundColor = UIColor.red.withAlphaComponent(0.3)
//      passwordTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
      UIView.animate(withDuration: 0.1, animations: {
        
        self.userNameTextFiled.frame.origin.x -= 10
        self.passwordTextField.frame.origin.x -= 10
      }, completion: { _ in
        
        UIView.animate(withDuration: 0.2, animations: {
          self.userNameTextFiled.frame.origin.x += 20
          self.passwordTextField.frame.origin.x += 20
        }, completion: { _ in
          UIView.animate(withDuration: 0.2, animations: {
            self.userNameTextFiled.frame.origin.x -= 10
            self.passwordTextField.frame.origin.x -= 10
          })
        })
      })
    }
  }
  
  func findUser(name: String, password: String) -> Bool{
    guard let userList:[[String:String]] = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] else{return false}
    for userData in userList{
      let memberID: String = userData["ID"]!
      if memberID == name{
        let memberPW: String = userData["PW"]!
        if memberPW == password {
          return true
        }
      }
    }
    
//    if name == memberID{
//      guard let memberPW = UserDefaults.standard.string(forKey: "PW")else{return false}
//      //2. PW 유효한지
//      if password == memberPW {
//        return true
//      }
//    }
    return false
  }
  
  
}
