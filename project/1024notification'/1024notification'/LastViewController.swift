//
//  LastViewController.swift
//  1024notification'
//
//  Created by okkoung on 2017. 10. 24..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {

  @IBOutlet weak var inputTextfield: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    
  }

  @IBAction func didTapBtn(_ sender: UIButton) {
    
    NotificationCenter.default.post(name: Notification.Name.init("TestNoti"), object: inputTextfield!.text, userInfo: ["noti":"info"])
    
  }
  
  

}

extension Notification.Name {
  static let testPush:Notification.Name = Notification.Name("TestNoti")
}
