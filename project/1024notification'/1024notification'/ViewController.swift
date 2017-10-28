//
//  ViewController.swift
//  1024notification'
//
//  Created by okkoung on 2017. 10. 24..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fistLB: UILabel!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(forName: NSNotification.Name.init("TestNoti"), object: nil, queue: nil) {(noti) in
      if let text = noti.object as? String {
        self.fistLB.text = text
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

