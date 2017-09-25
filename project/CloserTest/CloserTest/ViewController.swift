//
//  ViewController.swift
//  CloserTest
//
//  Created by okkoung on 2017. 9. 20..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  func operationCloser(oper: String) -> ((Double, Double) -> (Double))?{
    switch oper{
    case "+":
      return {(n1: Double, n2: Double) -> Double in return n1 + n2}
    case "-":
      return {(n1: Double, n2: Double) -> Double in return n1 - n2}
    case "*":
      return {(n1: Double, n2: Double) -> Double in return n1 * n2}
    case "%":
      return {(n1: Double, n2: Double) -> Double in
        if n2 != 0{
          return n1 / n2
        }
        else {
          return 0
        }
      }
    default:
      return nil
    }
    let dic: [String:(Int, Int) -> Int] = ["+": {(num1, num2) -> Int in return num1 + num2},
                                           "-": {(num1, num2) -> Int in return num1 - num2}
    ]
    let sum = dic["+"]!(3,2)
    
  }
  

  
}

