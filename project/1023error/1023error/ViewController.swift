//
//  ViewController.swift
//  1023error
//
//  Created by okkoung on 2017. 10. 23..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  enum NumberCheckType: Error {
    case nagativeNum
    case biggerNum
    case noNum
    case noData
  }
  
  func isSmallNum(_ baseNum : Int, targetNum: Int?) throws -> Int {
    guard let compareNum = targetNum else {
      throw NumberCheckType.noData
    }
    if baseNum < 0 || compareNum < 0 {
      throw NumberCheckType.nagativeNum
    }
    if compareNum > baseNum {
      throw NumberCheckType.biggerNum
    }
    return compareNum
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    do {
      let result = try isSmallNum(5, targetNum: -1)
      print(result)
    } catch NumberCheckType.noData {
      print("input value")
    } catch NumberCheckType.nagativeNum {
      print("input positive")
    } catch NumberCheckType.biggerNum {
      print("input small num, please")
    } catch {
      print("another error?")
    }
    
    
  }




}

