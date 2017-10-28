

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var scrollviewDesu: UIScrollView!
  @IBOutlet weak var userNameTextfield: CustomTextfield!
  @IBOutlet weak var passwordTextfield: CustomTextfield!
  
  
  
    override func viewDidLoad() {
      
      super.viewDidLoad()

      userNameTextfield.leftView = UIImageView(image: #imageLiteral(resourceName: "4F"))
      userNameTextfield.leftViewMode = .always
      
//      let attributedString = NSMutableAttributedString(string: "아이디를 입력해주세요")
      //      attributedString.addAttribute(
//        NSAttributedStringKey.foregroundColor,
//        value: UIColor.red.withAlphaComponent(0.5),
//        range: NSRange(location: 0, length: 3))
//      userNameTextfield.attributedPlaceholder = attributedString
      
      userNameTextfield.configureAttributedString(
        string: "아이디를 입력해주세요",
        range: NSRange(location: 0, length: 3),
        stringColor: UIColor.red.withAlphaComponent(0.5)
      )
      
      passwordTextfield.leftView = UIImageView(image: #imageLiteral(resourceName: "3F"))
      passwordTextfield.leftViewMode = .always
      passwordTextfield.configureAttributedString(
        string: "비밀번호를 입력해주세요",
        range: NSRange(location: 0, length: 4),
        stringColor: UIColor.red.withAlphaComponent(0.5)
      )
      
    
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
      
      
    }

  @objc func keyboardWillShow(notification: Notification){
    guard let userInfo = notification.userInfo else {return}
    guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else{return}
    scrollviewDesu.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height + 100, 0)
  }
  @objc func keyboardWillHide(notification: Notification){
    scrollviewDesu.contentInset = UIEdgeInsets.zero
  }

  @IBAction func didTapLoginBtn (_ sender: RoundButton){
    
//    if !UserDefaults.standard.bool(forKey: "isLogined") {
//      if let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi") {
//        self.present(presentVC, animated: true, completion: nil)
//      }
//    }
  
    guard let username = userNameTextfield.text, !username.isEmpty else { return }
    guard let password = passwordTextfield.text, !password.isEmpty else { return }
    
    if UserService.sharedinstance.validateUserInfo(username: username, password: password) {
      // 로그인이 성공
      self.navigationController?.dismiss(animated: true, completion: nil)
      print("성공")
      UserDefaults.standard.set(true, forKey: "isLogined")
    } else {
      // 로그인이 실패
      print("실패")
    }
    
  }
  

  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
