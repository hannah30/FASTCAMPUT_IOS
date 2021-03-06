

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var titleImg: UIImageView!
  @IBOutlet weak var inputNicknameTF: UITextField!
  @IBOutlet weak var startBtn: UIButton!
  @IBOutlet weak var imScrollView: UIScrollView!
  
  var questionList: [QuestionCenter] = []
  var newQuestionList: [Int:[String:Any]] = []
  
  override func viewDidLoad() {
 
    titleImg.layer.cornerRadius = titleImg.bounds.size.width / 2
    startBtn.layer.cornerRadius = 25
  
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
  }

  @objc func keyboardWillShow(notification: Notification){
    guard let userInfo = notification.userInfo else {return}
    guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else{return}
    imScrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height + 100, 0)
  }
  @objc func keyboardWillHide(notification: Notification){
    imScrollView.contentInset = UIEdgeInsets.zero
  }

  @IBAction func didTabTestStart(_ sender: UIButton) {
    if !(inputNicknameTF.text?.isEmpty)! {
      performSegue(withIdentifier: "ShowOne", sender: nil)
      
      
      let index = Int(arc4random_uniform(UInt32(questionList.count)))
      
      
    }else {
      let alret = UIAlertController(title: "닉네임", message: "닉네임을 입력해주세요", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
      alret.addAction(okAction)
      present(alret, animated: true, completion: nil)
    }
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
 
}



