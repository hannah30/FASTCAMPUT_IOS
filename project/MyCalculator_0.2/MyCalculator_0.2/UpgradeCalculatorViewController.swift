//
//  UpgradeCalculatorViewController.swift
//  MyCalculator_0.2
//
//  Created by okkoung on 2017. 9. 20..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class UpgradeCalculatorViewController: UIViewController {
  
  
//MARK: - UI Property
  //계산결과가 나오는 label
  @IBOutlet weak var displayLB: UILabel!
  
//MARK: - Property
  var operation: ((Double, Double) -> Double)? {
    didSet {
      displayNumber = nil
    }
  }

  var watingNum: Double?
  var displayNumber: Double?{
    willSet{
      if let newValue = newValue
      {
        self.displayLB.text = String(newValue)
      }
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
//MARK: - IBAtion
  
  
  @IBAction func numberAction(_ sender: UIButton) {
    let digit: Double = 10
    let inputNum = Double(sender.tag)
    
    if let newNumber = displayNumber {
      displayNumber = (newNumber * digit) + inputNum
    }else {
      displayNumber = inputNum
    }
  }
 
  let operationLabel:[String] = ["/", "*", "-", "+", "="]
  @IBAction func operateAction(_ sender: UIButton) {
 
    guard let displayNum = displayNumber else {return}
    guard let opSymbol = sender.titleLabel?.text else {return}
    
    switch opSymbol{
    case "/":
      operation = divide
    case "*":
      operation = multy
    case "-":
      operation = minus
    case "+":
      operation = sum
    case "=":
      print("나누기")
      result(oper: operation!, calcuNum: displayNum)
    default:
      print("has no symbol")
    }
    watingNum = displayNum
  }
  
  func result(oper:((Double, Double) -> Double)?, calcuNum:Double){
    guard let watingNum = watingNum else {return}
    if let operation = oper {
      displayNumber = operation(watingNum, calcuNum)
    }else {
      displayNumber = calcuNum
    }
  }
  
  //clear
  @IBAction func etcAction(_ sender: UIButton) {
  }
  
  //MARK: - Secret Method
  let sum = {(num1, num2) -> Double in num1 + num2}
  let minus = {(num1, num2) -> (Double) in num1 - num2}
  let multy = {(num1, num2) -> (Double) in num1 * num2}
  let divide = {(num1, num2) -> (Double) in num1 / num2}
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
