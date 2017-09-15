//
//  ViewController.swift
//  hitori0913
//
//  Created by okkoung on 2017. 9. 14..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var displayLavel:UILabel!
 
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  var displayText: String = ""
  @IBAction func numberKey(btn: UIButton){

//   if displayLavel.text == btn.titleLabel?.text {
// 값을 입력하면 displayText에 표시해주기
    if displayLavel.text == "0" {
     displayText = btn.titleLabel!.text!
    }else {
    // 연속으로 숫자를 넣었을때 그 숫자도 함께 추가해서 display
      displayText += (btn.titleLabel?.text)!
    }
    displayLavel.text = displayText
    
  }
  
  @IBAction func deleteBtn (btn: UIButton) {
   displayText = "0"
   displayLavel.text = displayText
  }
// MARK: me input 값 디스플레이만
// var temp: Int = 0
//  func plus (btn: UIButton) {
//    if displayLavel.text == btn.titleLabel?.text {
//      temp += Int(btn.titleLabel!.text!)!
//    }
//  }
//  func multi (btn: UIButton) {
//    if displayLavel.text == btn.titleLabel?.text {
//      temp += Int(btn.titleLabel!.text!)!
//      temp *= Int(btn.titleLabel!.text!)!
//    }
//  }
// MARK: me 연산만
  var oper: Int = 0
  var label: Int = 0
  //연산자가 들어오면 연산자를 oper변수에 저장 - 텍스트를 받아 바로 비교해 볼수 있어서 좀 불필요한 생각, 차라리 변수에 넣어두는게 좋은듯
  @IBAction func operation (btn: UIButton) {
    if btn.titleLabel?.text == "*" {
      oper = 1
    } else if btn.titleLabel?.text == "+" {
      oper = 2
    } else if btn.titleLabel?.text == "-" {
      oper = 3
    } else if btn.titleLabel?.text == "%" {
      oper = 4
    }
    //처음 입력된 값을 변수에 저장해둠
    label = Int(displayText)!
    displayLavel.text = "0"
  }
  
  var result: Int = 0
  var laberTwo: Int = 0
  //두번째 값이 입력되면 저장해둔 연산자와 비교하여 값을 실행, 예외처리는 안되어 있음. 1번만 계산가능
  @IBAction func calResult (btn: UIButton) {
    laberTwo = Int(displayText)!
    if oper == 1 {
    result = label * laberTwo
    }else if oper == 2 {
      result = label + laberTwo
    }else if oper == 3 {
      result = label - laberTwo
    }else if oper == 4 {
      result = label % laberTwo
    }
    
    displayLavel.text = String(result)
  }

}

