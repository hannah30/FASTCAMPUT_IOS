//
//  Subject.swift
//  GradingMachine
//
//  Created by okkoung on 2017. 9. 13..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

class Subject {
  var name: String = ""
  var score: Int = 0
  var grade: String = "F"
  var gradePoint: Double = 0.0
  var credit: Int = 1
  
  //과목의 점수를 학점으로 바꿔주는 함수
  func scoreChangeGrade (score: Int) {
    switch score {
    case 90...100:
      grade = "A"
    case 80...89:
      grade = "B"
    case 70...79:
      grade = "C"
    case 60...69:
      grade = "D"
    case 0...59:
      grade = "F"
    default:
      print("과락입니다")
    }
  }

}
