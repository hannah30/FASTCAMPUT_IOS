//
//  ViewController.swift
//  Vending
//
//  Created by okkoung on 2017. 9. 18..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var displayLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib
    
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  var displayText: String = ""
  @IBAction func cancelBtn(btn: UIButton) {
    displayText = "0"
    displayLabel.text = displayText
  }
  @IBAction func thousandBtn(btn: UIButton) {
    if displayLabel.text == displayText{
      
    }
  }


}

