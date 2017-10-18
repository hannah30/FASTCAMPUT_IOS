//
//  ViewController.swift
//  LoginUI
//
//  Created by okkoung on 2017. 9. 27..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var emailAdress: TextFieldOption!
  @IBOutlet weak var signIn: ButtonOption!
  @IBOutlet weak var password: TextFieldOption!
  
  @IBOutlet weak var failView: UIView!
  var usermodel = UserModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    emailAdress.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.touchUpInside)
    password.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.touchUpInside)
    
    failView.isHidden = true
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let nextViewController = segue.destination as? SignUpViewController{
      nextViewController.didTaskClosure = {(name:String, password: String) -> Void in
        self.usermodel.addUser(name: name, password: password)
      }
    }
  }
  
  @IBAction func didTabFailViewExit(_ sender: UIButton) {
    
    failView.isHidden = true//에니메이션 효과는 줄수 없나
  }
  @objc func didEndOnExit(_ sender: UIButton){
    if sender == emailAdress{
      password.becomeFirstResponder()
    }
  }

  @IBAction func didTapSignin(_ sender: UIButton) {
    guard let emailadressText = emailAdress.text else {return}
    guard let passwordText = password.text else {return}
    let isLoginScessed: Bool = usermodel.findUser(name: emailadressText, password: passwordText)
    if isLoginScessed {
      let main = MainViewController()
      present(main, animated: true, completion: nil)
    } else {
      
      UIView.animate(withDuration: 0.2, animations: {
        
        self.failView.isHidden = false
        self.failView.frame.origin.y += 50
      })
//      failView.isHidden = false
    }
  }

}

