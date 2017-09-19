//
//  ViewController.swift
//  MyVendingTest
//
//  Created by okkoung on 2017. 9. 18..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 //보유 금액이 표시 되는 부분
  @IBOutlet weak var moneyDisplayLB: UILabel!
  //allMoney에 계속 돈을 더해서 저장해둘 변수
  var allMoney: Int = 0
  //구입한 차에 대한 안내 mention
  @IBOutlet weak var buyMetionLB: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
//차 구입버튼을 누를때마다 allMoney의 금액은 차감이 됨
  @IBAction func buyCar(buyCarBtn: UIButton) {
    if buyCarBtn.tag == 1 && allMoney > 999 {
      allMoney -= 1000
      moneyDisplayLB.text = String(allMoney) + "원"
      buyMetionLB.text = "카니발을 구매하셨습니다."
    }else if buyCarBtn.tag == 2 && allMoney > 4999{
      allMoney -= 5000
      moneyDisplayLB.text = String(allMoney) + "원"
      buyMetionLB.text = "렌지로버를 구매하셨습니다."
    }else if buyCarBtn.tag == 3 && allMoney > 3999 {
      allMoney -= 4000
      moneyDisplayLB.text = String(allMoney) + "원"
      buyMetionLB.text = "오딧세이를 구매하셨습니다."
    }else if allMoney >= 0 {
      moneyDisplayLB.text = "잔액이 부족합니다"
    }
    moneyDisplayLB.textColor = UIColor.orange
  }
  
  //버튼이 클릭될때마다 버튼에 해당하는 값을 더해주고 moneyDisplay에 표시되는 금액 표시를 합계금액으로 해줌
  //tag 1~3, <- 5000, 2000, 1000
  @IBAction func myMoney(addMoneyBtn: UIButton) {
    if addMoneyBtn.tag == 1 {
      allMoney += 5000
      moneyDisplayLB.text = String(allMoney) + "원"
    }else if addMoneyBtn.tag == 2 {
      allMoney += 2000
      moneyDisplayLB.text = String(allMoney) + "원"
    }else if addMoneyBtn.tag == 3 {
      allMoney += 1000
      moneyDisplayLB.text = String(allMoney) + "원"
    }
  }
  //allmoney에 , 추가해보기
  func comma (addComma: Int) -> String {
    allMoney
    return
  }
  
  
// 잔액이 부족한데 왜 구매가 될까... allmoney의 값을 단순히 0보다 크다가 아니고 구매금액에 근접하게 하니 수정
// label에 텍스트 컬러를 변경하려면 어떻게 해야하는지? textColor로 해결
  
}


