//
//  ViewController.swift
//  MyCalculator_0.2
//
//  Created by okkoung on 2017. 9. 20..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

//enum Oper {
//  case *
//  case -
//  case +
//  case =
//  case %
//}

class ViewController: UIViewController {
  
 
  @IBOutlet weak var displayLB: UILabel!
  
  


  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  var displayValue: Double? {
    willSet {
      if let realValue = newValue {
      self.displayLB.text = String(realValue)
      }      
    }
  }
  
  @IBAction func numberPadBtn (_ sender: UIButton){
    let buttonValue: Double = Double(sender.tag)
    let digit: Double = 10
    if let newvalue = displayValue {
      displayValue = (newvalue * digit) + buttonValue
    }else {
      displayValue = buttonValue
    }
  }
  
  var operResult: Double{
    didSet{
    displayValue = nil
    }
  }
  var operChange: Double?
  @IBAction func operBtn(_ sender: UIButton) {
    let oper = sender.titleLabel?.text
    switch oper {
    case "%":
      
    case "+":
      
    case "-":
      
    case "*":
      
    case "=":
      
    default:
      print("no match symbol")
    }
    operChange = displayValue
  }

  @IBAction func cancelBtn(_ sender: UIButton) {
    displayValue = 0
  }


}
