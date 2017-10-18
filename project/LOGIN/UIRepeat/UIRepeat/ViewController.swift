//
//  ViewController.swift
//  UIRepeat
//
//  Created by okkoung on 2017. 9. 26..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var lb: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    //view를 만들고 바로 addsubview를 해라 그럼 안까먹는다.
    let subview: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    view.addSubview(subview)
    subview.backgroundColor = UIColor.brown
    subview.alpha = 0.5
    subview.layer.borderColor = UIColor.black.cgColor
    subview.layer.borderWidth = 2
    subview.layer.cornerRadius = 20
    
    
    let subviewOne: UIView = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
    view.addSubview(subviewOne)
    subviewOne.backgroundColor = UIColor(red: 64.0/255.0, green: 80.0/255.0, blue: 64.0/255.0, alpha: 0.9)
    subviewOne.isHidden = true
    
    let subviewThree: UIView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
    view.addSubview(subviewThree)
    subviewThree.backgroundColor = .purple

    // subviewThree를 기준으로 x, y좌표값을 가지게 된다
    let subviewFour: UIView = UIView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
    subviewThree.addSubview(subviewFour)
    subviewFour.backgroundColor = #colorLiteral(red: 1, green: 0.5595374107, blue: 0.9568168521, alpha: 1)
    
//    let img: UIImageView = UIImageView(frame: CGRect(x: 100, y: 400, width: 400, height: 400))
//      view.addSubview(img)
//      img.image = UIImage(named: "profile.jpg")
//      img.animationImages?.append(UIImage(named: "login_Bg.png")!)
    
    lb = UILabel(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
    view.addSubview(lb)
    lb.font = UIFont(name: "Noto Sans", size: 15)
    lb.text = "hi my name is hannah \n hi123456789"
    lb.numberOfLines = 2
    lb.textAlignment = .center
    lb.textColor = UIColor.red
    lb.highlightedTextColor = UIColor.cyan
    lb.isHighlighted = true
    lb.backgroundColor = UIColor.darkGray
    
    let btn: UIButton = UIButton(type: UIButtonType.system)
    btn.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
    btn.setTitle(" 버튼이 두줄로 가능하게 되려면 어떻게 해야 가능할까요", for: UIControlState.normal)
    btn.titleLabel?.numberOfLines = 3
    btn.setTitleColor(UIColor.black, for: UIControlState.normal)
    btn.addTarget(self, action: #selector(ViewController.btnAction(_:)), for: UIControlEvents.touchUpInside)
    btn.backgroundColor = UIColor.blue
    view.addSubview(btn)
    
    let btn2: UIButton = UIButton()
    btn2.frame = CGRect(x: 20, y: 20, width: 80, height: 80)
    view.addSubview(btn2)
    btn2.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
    btn2.titleLabel?.text = "hi"
    z
    
  
    
    
    
    
    
    
  }
  
  @objc func btnAction(_ sender: UIButton) {
    print("click")
    lb.text = "change"
    lb.backgroundColor = .red
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

