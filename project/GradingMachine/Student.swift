//
//  Student.swift
//  GradingMachine
//
//  Created by okkoung on 2017. 9. 13..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation


class Student {
  var name: String
  var studentId: Int
  var subjects:[Subject] = []
  var totalGrade: String = "F"
  var totalScore: Int = 0
  var totalGradePont:Double = 0.0
  var average:  Double = 0.0
  
  //학생 이름과 아이디라는 고유값을 꼭 받아야 하므로 꼭 받아야 하는 두 값은 인스턴스를 생성해두기
  init(name: String, id: Int) {
    self.name = name
    self.studentId = id
  }
  
  //과목의 배열을 받아서 총점을 구해주는 함수
  // 파라미터로 받는 모든 과목들을 배열에 넣어둠
  func setSubjects (subject:[Subject]) -> Int {
    self.subjects = subject
    //모든 과목의 점수값의 총점을 구해둠
    for i in subject {
      totalScore += i.score
    }
    return totalScore
  }
  
}
