
import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var idInputTextfield: CustomTextfield!
  
  @IBOutlet weak var emailInputTextField: CustomTextfield!
  
  @IBOutlet weak var passwordInputTextfield: CustomTextfield!
  
  @IBOutlet weak var repasswordInputTextfield: CustomTextfield!
  
  @IBOutlet weak var scrollViewDesu: UIScrollView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
      
      idInputTextfield.leftView = UIImageView(image: #imageLiteral(resourceName: "4F"))
      idInputTextfield.leftViewMode = .always
      
      //      let attributedString = NSMutableAttributedString(string: "아이디를 입력해주세요")
      //      attributedString.addAttribute(
      //        NSAttributedStringKey.foregroundColor,
      //        value: UIColor.red.withAlphaComponent(0.5),
      //        range: NSRange(location: 0, length: 3))
      //      userNameTextfield.attributedPlaceholder = attributedString
      
      idInputTextfield.configureAttributedString(
        string: "아이디를 입력해주세요",
        range: NSRange(location: 0, length: 3),
        stringColor: UIColor.red.withAlphaComponent(0.5)
      )
      
      emailInputTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "1E"))
      emailInputTextField.leftViewMode = .always
      emailInputTextField.configureAttributedString(
        string: "비밀번호를 입력해주세요",
        range: NSRange(location: 0, length: 4),
        stringColor: UIColor.red.withAlphaComponent(0.5)
      )
      
      passwordInputTextfield.leftView = UIImageView(image: #imageLiteral(resourceName: "3F"))
      passwordInputTextfield.leftViewMode = .always
      passwordInputTextfield.configureAttributedString(
        string: "비밀번호를 입력해주세요",
        range: NSRange(location: 0, length: 4),
        stringColor: UIColor.red.withAlphaComponent(0.5)
      )
      
      repasswordInputTextfield.leftView = UIImageView(image: #imageLiteral(resourceName: "3F"))
      repasswordInputTextfield.leftViewMode = .always
      repasswordInputTextfield.configureAttributedString(
        string: "비밀번호를 다시 입력해주세요",
        range: NSRange(location: 0, length: 4),
        stringColor: UIColor.red.withAlphaComponent(0.5)
      )
      
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
      
      
  }
  
  @objc func keyboardWillShow(notification: Notification){
    guard let userInfo = notification.userInfo else {return}
    guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else{return}
    scrollViewDesu.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height + 100, 0)
  }
  @objc func keyboardWillHide(notification: Notification){
    scrollViewDesu.contentInset = UIEdgeInsets.zero
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  @IBAction func didTapBtnSignUp(_ sender: RoundButton) {
    
    
  }
  
  

}
