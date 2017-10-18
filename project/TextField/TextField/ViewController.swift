//
//  ViewController.swift
//  TextField
//
//  Created by okkoung on 2017. 9. 26..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  var tf: UITextField!
  var lb: UILabel!
  var temp: String = ""
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tf = UITextField(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
    tf.borderStyle = .roundedRect
    tf.backgroundColor = .blue
    tf.placeholder = "여기 입력"
    tf.delegate = self
    view.addSubview(tf)
    
    let btn: UIButton = UIButton(type: .infoLight)
    btn.frame = CGRect(x: 100, y: 20, width: 100, height: 100)
    btn.addTarget(self, action: #selector(ViewController.btnAction(_:)), for: .touchUpInside)
    view.addSubview(btn)
    
    lb = UILabel(frame: CGRect(x: 20, y: 150, width: 100, height: 100))
    lb.numberOfLines = 0
    lb.backgroundColor = .red
    
    view.addSubview(lb)
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture(_:)))
    view.addGestureRecognizer(tapGesture)
  }
  
  func btnAction(_ sender: UIButton){
    temp += tf.text! + "\n"
    lb.text = temp
    tf.text = ""
    resignFirstResponder()
    
  }
  
  @objc func didTapGesture(_ sender: UITapGestureRecognizer) {
    
    for view in view.subviews {
      view.resignFirstResponder()
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    tf.resignFirstResponder()
    
    return true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

