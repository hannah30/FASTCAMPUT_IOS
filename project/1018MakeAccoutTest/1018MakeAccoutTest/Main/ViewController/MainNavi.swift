//
//  MainNavi.swift
//  1018MakeAccoutTest
//
//  Created by okkoung on 2017. 10. 23..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class MainNavi: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if !UserDefaults.standard.bool(forKey: "isLogined") {
//     showLogingPage()
      performSegue(withIdentifier:"GoToLoginSegue", sender: nil)
    
    }
  }
  
  func showLogingPage() {
//    if let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi") {
//      self.present(presentVC, animated: false, completion: nil)
//    }
    
    performSegue(withIdentifier: "login", sender: nil)
  }

}
