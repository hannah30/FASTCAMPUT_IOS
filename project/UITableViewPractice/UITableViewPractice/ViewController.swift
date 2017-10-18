//
//  ViewController.swift
//  UITableViewPractice
//
//  Created by okkoung on 2017. 9. 29..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  override func viewDidLoad() {
    super.viewDidLoad()
    let tv : UITableView = UITableView(frame: view.bounds, style:.plain)
    tv.delegate = self
    tv.dataSource = self
    tv.register(MyCustomCell.self, forCellReuseIdentifier: "Cell")
    view.addSubview(tv)
    
    
  }
  var list: [String] = ["icon_new", "like_on", "icon_list", "attend_no_icon", "attend_chk_icon"]
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCustomCell
//    cell.textLabel?.text = list[indexPath.row]
    cell.setImg(name: list[indexPath.row])
    cell.lb?.text = list[indexPath.row]
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let alret: UIAlertController = UIAlertController(title: "테이블선택", message: "\(list[indexPath.row])테이블을 선택하셨습니다", preferredStyle: .alert)
    let alretA: UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
    let alretB: UIAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    alret.addAction(alretA)
    alret.addAction(alretB)
    present(alret, animated: true, completion: nil)
  }

}

