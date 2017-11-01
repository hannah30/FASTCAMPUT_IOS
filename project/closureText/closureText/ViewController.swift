//
//  ViewController.swift
//  closureText
//
//  Created by okkoung on 2017. 11. 1..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var customView: CustomView!
  @IBOutlet weak var changeLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    customView.didTabclosure = { self.changeLabel.text = $0 }
    
//    (0...10).filter { $0 % 2 == 0 }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

