//
//  ViewController.swift
//  link
//
//  Created by okkoung on 2017. 11. 7..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
  @IBOutlet weak var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let url = URL(string: "https://www.google.com")!
    let string = """
    신고하기
    ㄴㅇㄹㅇㄴㄹ
    ㄴㅇㄹㄴㄹ
    """
    let attributedString = NSMutableAttributedString(string: string)
    attributedString.addAttribute(.link, value: url, range: NSRange(location: 0, length: 4))
    
    textView.attributedText = attributedString
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func textView(_ textView: UITextView, shouldInteractWith URL: URL,
                in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    
    return true
  }


}

