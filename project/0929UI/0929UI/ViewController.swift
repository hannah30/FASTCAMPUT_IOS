//
//  ViewController.swift
//  0929UI
//
//  Created by okkoung on 2017. 9. 29..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
   //UIView
  //UILabel. UIImageView, UIScrollerView  ----> 여러개의 뷰
  //UIScrollerView를 상속받음
  //UITableView
  //UICollectionView
    
  //UIControl - addTagget : 사용자의 행동을 받는 것들
  //MVC 패턴에서 V가 C 에게 전달할때 target
  //UIButton, UISwitch, UISlider, UISegumentController, UITextField
  //UITableView를 상속받음
  //UITextView
    
  //viewDidLoad에 너무 코드가 길어지니 함수로 빼둔다.
    createView()
    
    
  }

  /* 클로저 사용시는 이렇게
  let subView2: UIView = {
    let subView: UIView = UIView()
    subView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    subView.tag = 10
  
    return subView
  }()
  */
    //메모리상으로는 이렇게 변수를 만들어 주는게 좋다.
  weak var subView: UIView!
  weak var lb: UILabel!
  weak var sc: UIScrollView!
  //이렇게 뷰를 그리는 메서드를 정리해서 사용하면 코드도 정리가 잘되서 좋다. 일반적인 방법
  @objc func createView(){
    
    let subView: UIView = UIView()
    subView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    subView.tag = 10
    view.addSubview(subView)
    self.subView = subView
    //view.addSubview(subView2)  클로저를 사용할 경우
    
    //스크롤뷰의 유의점은 컨텐츠뷰가 있다는 것. 사이즈를 지정해줘야 하고 델리게이트를 통해 스크롤 상태 정보를 받아볼 수 있다. 델리게이트를 했다고 꼭 액션을 해야 하는건 아니다. 그냥 상태만 받아도 된다
    //컨텐츠뷰의 사이즈는 보통 스크롤뷰를 바탕으로 하므로 레이아웃함수에서 만들어 주는게 좋다.
    let scrollView: UIScrollView = UIScrollView()
    scrollView.delegate = self
    view.addSubview(scrollView)
    self.sc = scrollView
    
    let lb: UILabel = UILabel()
    //lb.text = "hello"
    //구글링을 해서 소스를 붙여봄
    lb.attributedText = NSAttributedString(string: "hello", attributes:
      [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleDouble.rawValue,NSLinkAttributeName:URL(string:"http://naver.com")!])
    lb.font = UIFont.systemFont(ofSize: 14)
    lb.tag = 100
    //레이블의 위치나 모양을 확인하기위해 임시로 백그라운드를 넣었다가 나중에 지우는것도 괜찮음
    scrollView.addSubview(lb)
    self.lb = lb
    
    //1. type설정은 초기화 수준에서만 가능버튼의 type는 초기화할때만 바꿀수 있으므로 시스템버튼이 아닌 다른 type을 쓰려면 초기화할때 해야 한다.
    let btn: UIButton = UIButton()
    //2. 상태선택, 그리고 꼭 state를 정해줘야 하므로 setTitle로 해줘야 한다.
    btn.setTitle("button", for: .normal)
    btn.setTitle("click", for: .highlighted)
    //3. addTafgetting
    btn.addTarget(self, action: #selector(ViewController.btnAction(_:)), for: .touchUpInside)
    scrollView.addSubview(btn)
    

    
  }
  
  func makeTableView(){
    let tableView: UITableView = UITableView(frame: CGRect(x: 0, y:0, width:view.frame.size.width, height: view.frame.size.height), style: .plain)
    tableView.dataSource = self
    view.addSubview(tableView)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = indexPath.section
    let cell = UITableViewCell()
    return cell
  }
  
  func btnAction(_ sender: UIButton){
    
  }
  
  func updateLayout(){
    //변수를 만들어서 사이즈를 넣어두면 길게 안써도 되서 좋다.
    let screenSize: CGFloat = view.frame.size.width - 32
    let viewWidth: Int = 200
    subView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewWidth)
    
    //스크롤뷰 사이즈를 정하고 컨텐츠뷰 사이즈를 정해야 한다.
    sc.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewWidth)
    sc.contentSize = CGSize(width: screenSize * 10, height: sc.frame.size.height)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

