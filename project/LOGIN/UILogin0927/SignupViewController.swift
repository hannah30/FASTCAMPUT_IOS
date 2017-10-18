//
//  SignupViewController.swift
//  0927
//
//  Created by okkoung on 2017. 9. 27..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
  
  //Property
  @IBOutlet weak var accoutName: UITextField!
  @IBOutlet weak var accountPassword: UITextField!
  @IBOutlet weak var accountRePassword: UITextField!
  
  var didTaskClosure: ((String, String) -> Void)?
  
  
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    accoutName.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
    accountPassword.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
    accountRePassword.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
    
    
    // Do any additional setup after loading the view.
  }
  
  @objc func didEndOnExit(_ sender: UITextField){
    if sender === accoutName {
      accountPassword.becomeFirstResponder()
    }else if sender === accountPassword{
      accountRePassword.becomeFirstResponder()
    }
  }
  
  @IBAction func didTapMakeAccount(_ sender: UIButton) {
    guard let accoutname = accoutName.text else{return}
    guard let accounpassword = accountPassword.text else{return}
    guard let accountrepassword = accountRePassword.text else {return}
    
    
    if accounpassword == accountrepassword {
      
//      didTaskClosure?(accoutname, accounpassword)
      
      var list:[[String: String]] = []
      if let tempList = UserDefaults.standard.array(forKey: "UserList") as? [[String: String]] {
        list = tempList
      } else {
        list = []
      }
      let userData:[String: String] = ["ID": accoutname, "PW": accounpassword]
      list.append(userData)
      UserDefaults.standard.set(list, forKey: "UserList")
      
//      UserDefaults.standard.set(accoutname, forKey: "ID")
//      UserDefaults.standard.set(accounpassword, forKey: "PW")
      
      
      dismiss(animated: true, completion: nil)
      
    }else{
      print("fail")
    }
    
    
  }


  
  @IBAction func didTapExit(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
    
  }
  
  
  
}
