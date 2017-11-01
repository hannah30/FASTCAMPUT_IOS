//
//  ViewController.swift
//  closure
//
//  Created by okkoung on 2017. 11. 1..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
  

  
  override func viewDidLoad() {
    
    let number = 1...10
    
    let totalNum = number.filter { (num) -> Bool in
      return num % 2 == 0
      }.reduce(0) { (r, num) -> Int in
        return r + num
    }
    let totalFunNum = totalNum(numbers: Array(number))
    
  }

  //1~10
  

}
