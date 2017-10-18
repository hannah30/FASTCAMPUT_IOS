//
//  SecondViewController.swift
//  1017test
//
//  Created by okkoung on 2017. 10. 10..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var displayLB: UILabel!
  var sendedMsg:String?
  override func viewDidLoad() {
        super.viewDidLoad()

        let closeBtn = UIButton(type: .roundedRect)
        closeBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        closeBtn.setTitle("close", for: .normal)
        closeBtn.setTitleColor(.white, for: .normal)
        closeBtn.addTarget(self, action: #selector(self.close(_:)), for: .touchUpInside)
        view.addSubview(closeBtn)
    
        displayLB.text = sendedMsg
    }
  func sendMsg(_ msg:String){
    sendedMsg = msg
   
  }
  @objc func close(_ sender:UIButton){
    dismiss(animated: true, completion: nil)
    
  }
  

}
