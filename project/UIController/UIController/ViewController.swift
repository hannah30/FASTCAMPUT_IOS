//
//  ViewController.swift
//  UIController
//
//  Created by okkoung on 2017. 9. 26..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//  var onBtn: UIButton!
//  var offBtn: UIButton!
  var btnOne: UIButton!
  var btnTwo: UIButton!
  var btnThree: UIButton!
  var btnFour: UIButton!
  var btnFive: UIButton!
  var btnSix: UIButton!
  var btnSeven: UIButton!
  var btnEight: UIButton!
  var btnNine: UIButton!
  var btnM: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    btnOne = UIButton()
    btnOne.frame = CGRect(x: 0, y: 0, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnOne.backgroundColor = .blue
    btnOne.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnOne)

    
    btnTwo = UIButton()
    btnTwo.frame = CGRect(x: view.frame.size.width / 3, y: 0, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnTwo.backgroundColor = .purple
    btnTwo.isSelected = true
    btnTwo.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnTwo)
    
    btnThree = UIButton()
    btnThree.frame = CGRect(x: view.frame.size.width / 3 * 2, y: 0, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnThree.backgroundColor = .blue
    btnThree.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnThree)
    
    btnFour = UIButton()
    btnFour.frame = CGRect(x: 0, y: view.frame.size.height / 3, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnFour.backgroundColor = .purple
    btnFour.isSelected = true
    btnFour.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnFour)
    
    btnFive = UIButton()
    btnFive.frame = CGRect(x: view.frame.size.width / 3, y: view.frame.size.height / 3, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnFive.backgroundColor = .blue
    btnFive.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnFive)
    
    btnSix = UIButton()
    btnSix.frame = CGRect(x: view.frame.size.width / 3 * 2, y: view.frame.size.height / 3, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnSix.backgroundColor = .purple
    btnSix.isSelected = true
    btnSix.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnSix)
    
    btnSeven = UIButton()
    btnSeven.frame = CGRect(x: 0, y: view.frame.size.height / 3 * 2, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnSeven.backgroundColor = .blue
    btnSeven.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnSeven)

    
    btnEight = UIButton()
    btnEight.frame = CGRect(x: view.frame.size.width / 3, y: view.frame.size.height / 3 * 2, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnEight.backgroundColor = .purple
    btnEight.isSelected = true
    btnEight.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnEight)
    
    btnNine = UIButton()
    btnNine.frame = CGRect(x: view.frame.size.width / 3 * 2, y: view.frame.size.height / 3 * 2, width: view.frame.size.width / 3, height: view.frame.size.height / 3)
    btnNine.backgroundColor = .blue
    btnNine.addTarget(self, action: #selector(ViewController.btnAction(_:)), for:.touchUpInside)
    view.addSubview(btnNine)
    
  }
  
  @objc func btnAction(_ sender: UIButton) {
    if sender.isSelected {
      sender.backgroundColor = .purple
      sender.isSelected = false
    }else{
      sender.backgroundColor = .blue
      sender.isSelected = true
    }
    
    
    }
  
  //컬러 한꺼번에 바꾸는거랑 버튼 누르면 레이블에 텍스트 나오는거 까지
  
//    onBtn = UIButton(type: .custom)
//    onBtn.frame = CGRect(x: 20, y: 100, width: 100, height: 100)
//    onBtn.setTitle("on", for: .normal)
//    //btn.setTitle("회원가입", for: .highlighted)
//    onBtn.setTitle("선택", for: .selected)
//    onBtn.setTitleColor(.blue, for: .normal)
//    //onBtn.setTitleColor(.red, for: .highlighted)
//    onBtn.setTitleColor(.red, for: .selected)
//    onBtn.backgroundColor = .purple
//    onBtn.addTarget(self, action: #selector(ViewController.onBtnAction(_:)), for: .touchUpInside)
//    view.addSubview(onBtn)
//    
//    offBtn = UIButton(type: .custom)
//    offBtn.frame = CGRect(x: 20, y: 250, width: 100, height: 100)
//    offBtn.setTitle("off", for: .normal)
//    //btn.setTitle("회원가입", for: .highlighted)
//    offBtn.setTitle("선택", for: .selected)
//    offBtn.setTitleColor(.blue, for: .normal)
//    //offBtn.setTitleColor(.red, for: .highlighted)
//    offBtn.setTitleColor(.red, for: .selected)
//    offBtn.backgroundColor = .purple
//    offBtn.isSelected = true
//    offBtn.isUserInteractionEnabled = false
//    offBtn.addTarget(self, action: #selector(self.offBtnAction(_:)), for: .touchUpInside)
//    view.addSubview(offBtn)
//
//  
//  }
//  func onBtnAction(_ sender: UIButton) {
//    sender.isSelected = true
//    sender.isUserInteractionEnabled = false
//    offBtn.isSelected = false
//    offBtn.isUserInteractionEnabled = true
//    }
//  
//  func offBtnAction(_ sender: UIButton) {
//    sender.isSelected = true
//    sender.isUserInteractionEnabled = false
//    onBtn.isSelected = false
//    onBtn.isUserInteractionEnabled = true
//    
//    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

