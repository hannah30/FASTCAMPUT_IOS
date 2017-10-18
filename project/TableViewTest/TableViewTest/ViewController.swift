//
//  ViewController.swift
//  TableViewTest
//
//  Created by okkoung on 2017. 9. 29..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    //스타일이 있기 때문에 초기화할때 바로 만들어주는 것이 좋다.
    let tv: UITableView = UITableView(frame: view.bounds, style: .plain)
    tv.dataSource = self
    //class 자체를 가르키는 self
    //자체 셀 디자인을 만들고 싶으면 UITableViewCell 클래스를 상속한 다른 클래스를 만들면 된다.
    //cell을 테이블뷰에 등록하는 것.
    tv.register(MyCell.self, forCellReuseIdentifier: "MyCell")
    tv.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    //두개의 셀 디자인을 사용하는것
    
    //row의 height는 델리게이트에 있어서 델리게이트를 차용해야 하고 왠만함 테이블뷰를 만들때 둘다 차용해 두는게 좋다.
    tv.delegate = self
 
    
    
    
    view.addSubview(tv)
    
    
  }
  let poketmon: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
//테이블뷰를 사용할때 필수로 작성해 줘야 하는 메서드 2개(numberOfRowsInSection, cellForRowAt) 프로토콜로 되어 있어서 그럼.
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    //각각의 섹션마다 다른 row수를 불러오려면 이렇게
    switch section {
    case 0:
      return poketmon.count - 4
    default:
      return poketmon.count
    }

//    return poketmon.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //셀디자인을 두개 쓸 경우 이렇게 각각 나눠서 써주면 된다.
    if indexPath.section == 0 {
     
      let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
          cell.textLabel?.text = poketmon[indexPath.row] + " 🌈"
          cell.selectionStyle = .blue
      return cell
    }else{
      
      //cell을 재사용 하겠다는 의미
      let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell //클래스를 다운캐스팅 해줌, 내가 만든 커스텀셀디자인을 쓸 경우
      cell.setImageName(name: poketmon[indexPath.row])
      //    cell.textLabel?.text = poketmon[indexPath.row] + " 🌈"
      //    cell.selectionStyle = .blue
      return cell
    }

    }
     //델리게이트 차용 후 height 함수를 써서 높이값 줌
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250
  }
  // 셀이 선택 됐을때
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let name = poketmon[indexPath.row]//각각의 로우에 들어가 있는 타이틀값
    let alertC: UIAlertController = UIAlertController(title: "test", message: "현재 귀하는 \(name)을 선택하셨습니다", preferredStyle: .alert)
    let alertA: UIAlertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
    alertC.addAction(alertA)
    
    present(alertC, animated: true, completion: nil)
  }
  
  //셀 밀어서 지우기
  /*
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    UITableViewCellEditingStyle.delete
  }
 */
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

