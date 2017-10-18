//
//  ViewController.swift
//  Delegate
//
//  Created by okkoung on 2017. 10. 12..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate {
  @IBOutlet var newView: CustomView!
  @IBOutlet var newLB: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newView.changeText(newText: "change")
    newView.delegate = self
  }
  func didSelectedCustomView(_ customView: CustomView) {
    newLB.text = "understand"
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

