//
//  SignUpViewController.swift
//  LoginUI
//
//  Created by okkoung on 2017. 9. 27..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: TextFieldOption!
  @IBOutlet weak var passwordTextField: TextFieldOption!
  @IBOutlet weak var rePasswordTextField: TextFieldOption!
  var didTaskClosure : ((String, String)-> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.addTarget(self, action: #selector(didTabReponder(_:)), for: UIControlEvents.touchUpInside)
    passwordTextField.addTarget(self, action: #selector(didTabReponder(_:)), for: UIControlEvents.touchUpInside)
    rePasswordTextField.addTarget(self, action: #selector(didTabReponder(_:)), for: UIControlEvents.touchUpInside)
    // Do any additional setup after loading the view.
    
  }
  
  @IBAction func didTabOnExit(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func ceateAccout(_ sender: UIButton) {
    guard let nameTextField = nameTextField.text else {return}
    guard let passwordTextField = passwordTextField.text else {return}
    guard let rePasswordTextField = rePasswordTextField.text else {return}
    
    if passwordTextField == rePasswordTextField {
      print("secess")
//      didTaskClosure?(nameTextField, passwordTextField)
      UserDefaults.standard.set(nameTextField, forKey: "ID")
      UserDefaults.standard.set(passwordTextField, forKey: "PW")
      dismiss(animated: true, completion: nil)
    }else {
      print("acount fail")
    }
  }
  
  func findUser(name: String, password: String) -> Bool{
    guard let memberID = UserDefaults.standard.string(forKey: "ID") else{return false}
    //1. ID유효한지
   
    if name == memberID{
      guard let memberPW = UserDefaults.standard.string(forKey: "PW")else{return false}
      //2. PW 유효한지
      if password == memberPW {
        return true
      }
    }
      return false
  }
  
  
  @objc func didTabReponder (_ sender: UITextField){
    if sender == nameTextField {
      passwordTextField.becomeFirstResponder()
    }else if sender == passwordTextField {
      rePasswordTextField.becomeFirstResponder()
    }
  }
  
}
