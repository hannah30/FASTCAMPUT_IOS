//
//  Computer.swift
//  BaseballGame
//
//  Created by okkoung on 2017. 9. 25..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

class Computer {

  
  func makeNumRandom() -> [Int] {
    var randomNumList:[Int] = []
    while randomNumList.count < 3 {
      let randomNum: Int = Int(arc4random_uniform(10))
      if !randomNumList.contains(randomNum) {
        randomNumList.append(randomNum)
      }
    }
    return randomNumList
  }
  
  func numCheck(answer:[Int], currectAnswer:[Int]) -> String {
    var ball: Int = 0
    var strike: Int = 0
    var out: Int = 0
    for count in 0..<answer.count {
      let ansewrNum = answer[count]
      if currectAnswer.contains(ansewrNum){
        if currectAnswer[count] == ansewrNum {
          strike += 1
        }else {
          ball += 1
        }
      }else {
        out += 1
      }
    }
    
    //체크 결과를 스트링으로 만들어 주기
    var resultString: String = ""
    if strike > 0 {
      resultString += "\(strike)S"
    }
    if ball > 0 {
      resultString += "\(ball)B"
    }
    if out > 0 {
      resultString += "\(out)O"
    }
    return resultString
  }

}
