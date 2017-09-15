//
//  TransMoney.swift
//  bank
//
//  Created by okkoung on 2017. 9. 14..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation
class TransMoney {
  
  func transMoney(fromBank: Account, toBank: Account, transM: Int) -> (Int, Int) {
//    var bal1: Int = 0
//    var bal2: Int = 0
//    bal1 = fromBank.money - toBank.money
//    bal2 = fromBank.money + toBank.money
    fromBank.money -= transM
    toBank.money += transM
    return (fromBank.money, toBank.money)
  }
}


