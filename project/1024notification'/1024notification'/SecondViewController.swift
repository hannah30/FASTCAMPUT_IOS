//
//  SecondViewController.swift
//  1024notification'
//
//  Created by okkoung on 2017. 10. 24..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var secondLB: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(forName: NSNotification.Name.init("TestNoti"), object: nil, queue: nil) {(noti) in
      if let text = noti.object as? String {
        self.secondLB.text = text
      }
    }
  }
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
