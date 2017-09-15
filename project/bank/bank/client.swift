//
//  client.swift
//  bank
//
//  Created by okkoung on 2017. 9. 14..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

class Client {
  let name: String
  var address: String
  var accounts: [Account] = []
  
  init(name: String, address: String) {
    self.name = name
    self.address = address
  }
  //각각의 계좌에 든 모든 돈을 합산하는 함수
  func totalAmount() -> Int {
    var total: Int = 0
    for i in accounts {
      total += i.money
    }
    return total
  }
  
  
}
