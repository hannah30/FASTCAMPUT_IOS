//
//  ViewController.swift
//  bank
//
//  Created by okkoung on 2017. 9. 14..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let account1: Account = Account(bankName: "woory", money: 3000)
    let account2: Account = Account(bankName: "cacao", money: 5000)
    
    let client1: Client = Client(name: "lion", address: "gangnam")
    let client2: Client = Client(name: "muji", address: "gabong")
    
   

   
    //클라이언트의 계좌를 배열에 넣어주고 totalAmount()를 호출함
    client1.accounts = [account1, account2]
    print(client1.totalAmount())
    
    let transTest = TransMoney()
    print(transTest.transMoney(fromBank: account1, toBank: account2, transM: 500))
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  }

