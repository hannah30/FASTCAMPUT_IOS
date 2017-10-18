//
//  ViewController.swift
//  delegateTest
//
//  Created by okkoung on 2017. 10. 12..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate {
  
  
  func didSwitchSelected(_ customview: CustomView) {
    newView.titleLBChange(newText: "I'm title")
    customview.imgChange(newImg: newimg)
  }
  
  @IBOutlet var newView: CustomView!
  let newimg = UIImage(named: "login_Bg")!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newView.delegate = self

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

