//
//  ViewController.swift
//  BaseballGame
//
//  Created by okkoung on 2017. 9. 21..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //MARK: IBOutlet
  @IBOutlet weak var resultLB: UILabel!
  @IBOutlet weak var numThreeLB: UILabel!
  @IBOutlet weak var numTwoLB: UILabel!
  @IBOutlet weak var numOneLB: UILabel!
  @IBOutlet weak var textDisplayView: UITextView!
  //MARK: Property
  //넘버패드에 들어오는 숫자를 label에 순서대로 넣기 위해 만든 배열 변수
  private var startBtnLBList: [UILabel]? = []
  //넘버패드에 들어오는 숫자들을 비교하기 위해 값을 넣어둘 배열 변수
  private var startBtnList: [Int] = []
  //start버튼을 눌러서 게임이 실행중일때임을 체크하기 위한 변수
  private var isRunning: Bool = false
  private var randomNumList: [Int] = []
  let computer: Computer = Computer()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startBtnLBList = [numThreeLB, numTwoLB, numOneLB]
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  //MARK: Btn
  
  @IBAction func startBtn(_ sender: UIButton) {
    isRunning = true
    //스타트버튼을 누르면 항상 값은 초기값이 되어야 하니까 여기서 해주는게 좋다
    clear()
    //스타트버튼을 누르면 정답이 될 랜덤 숫자를 만든다
    randomNumList = computer.makeNumRandom()
    //택스트뷰도 초기화 해줌 새로운 문제가 시작되니까.
    textDisplayView.text = ""
    //정답이 뭔지 보기위해 찍어봄
    print(randomNumList)
  }
  
  @IBAction func checkBtn(_ sender: UIButton) {
    //다시 해보기
    if isRunning && startBtnList.count == randomNumList.count {
      let score = computer.numCheck(answer: startBtnList, currectAnswer: randomNumList)
      if score == "3S" {
        resultLB.text = "정답👍👏"
        isRunning = false
      }else {
        resultLB.text = "ㅠ_ㅠ"
        addTextDisplayView(answer: startBtnList, score: score)
      }
    }
    //내가 해본 것
    //    if isRunning {
    //      for i in 0..<startBtnList!.count {
    //        for j in 0..<randomNumList.count {
    //          if startBtnList![i] == randomNumList[j] {
    //            if i == j {
    //              // strike count 1
    //              strike += 1
    //            } else {
    //              // ball count 1
    //              ball += 1
    //            }
    //          }
    //        }
    //      }
    //      resultLB.text = "\(strike)S \(ball)B"
    //      //"3S 0B"이라는 string 보다는 확실한 Int를 넣어서 비교해주자
    //      //3S이 나와야 정답이므로 그렇지 않으면 텍스트뷰에 지금 들어간 숫자와 결과를 보여줌
    //      if strike != 3 {
    //        let startStrValue = makeNumString()
    //        textDisplayView.text = textDisplayView.text + (resultLB.text! + " - " + startStrValue + "\n")
    //      }else {
    //        resultLB.text = "👍 👏 👏"
    //        isRunning = false   //너를 어디에 넣어서 체크버튼이 안먹게 해야겠니 ㅠ_ㅠ
    //      }
    //      startStr = ""
    //    }
    //내가 해본 것 끝
    //실패 1
    //   let count = startBtnList!.count - 1
    //
    //    var countNumber: Int = 0
    //    for i in startBtnList! {
    //      if randomNumList.contains(i) {
    //         countNumber += 1
    //
    //        // startBtnList
    //      }
    //      displayResultLB = "1B"
    //      resultLB.text = displayResultLB
    //    }
    //    resultLB.text = "\(countNumber)B"
    //값과 자리수를 비교하여 값=자리수면 strike + 1, 값만 같으면 ball+1
    //실패 1 끝
  }
  
  @IBAction func numberPadBtn(_ sender: UIButton) {
    if isRunning {
      let numValue = sender.tag
      guard let startBtnLBList = startBtnLBList else {return}
      if !startBtnList.contains(numValue) && startBtnList.count < startBtnLBList.count {
        startBtnList.append(numValue)
        //실제 값이 들어간 startBtnList의 마지막 인덱스를 변수에 넣어둠, LBList에 같은 인덱스에 넣어주기 위해
        let lastIndex = startBtnList.count - 1
        //startBtnLBList에 넣기 위해 마지막 인덱스를 알아옴/////////////
        let some = startBtnLBList[lastIndex]
        some.text = "\(numValue)"
      }
    }
  }
  @IBAction func deleteBtn(_ sender: UIButton) {
    if isRunning {
      //count가 0이 되어야 하므로 한번 초기화 시켜준다. 그래야 numberPadBtn 의 조건문에 통과가 되므로
      clear()
    }
  }
  
  //MARK: Method
  //임의의 세자리 숫자를 만드는 method
  //class로 빼줌
  
  //내가 해본 것
  //  //textview에 display하기 위해 startBtnList의 숫자들을 string으로 바꿔줌
  //  private func makeNumString() -> String {
  //    var startStr: String = ""
  //    for i in 0..<startBtnList.count {
  //      startStr += String(startBtnList[i])
  //    }
  //    return startStr
  //  }
  //  내가 해본 것 끝
    
  private func clear(){
    startBtnList = []
    guard let startBtnLBList = startBtnLBList else{return}
    for label in startBtnLBList{
      label.text = "0"
    }
  }
  private func addTextDisplayView(answer:[Int], score: String) {
    let answerValue = changeStr(answerList: answer)
    let answerValueResult = "\(answerValue)는 \(score)입니다."
    let textDisplayViewLine = textDisplayView.text + answerValueResult + "\n"
    textDisplayView.text = textDisplayViewLine
  }
  //내가 버튼으로 선택한 번호의 리스트를 스트링으로 바꿔줌
  private func changeStr(answerList:[Int]) -> String {
    var answerStr: String = ""
    for value in answerList {
      answerStr += "\(value)"
    }
    return answerStr
  }
}

