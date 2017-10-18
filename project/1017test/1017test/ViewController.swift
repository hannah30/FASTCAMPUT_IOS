//
//  ViewController.swift
//  1017test
//
//  Created by okkoung on 2017. 10. 10..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()

    let tv: UITableView = UITableView(frame: view.bounds)
    tv.dataSource = self
    tv.delegate = self
    tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    view.addSubview(tv)

}
  //row & cell을 만들기위해  datasource채택
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "This is Cell"
    
    return cell
  }
  //cell의 높이값을 변경하기 위해 delegate 채택
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  //셀 클릭 후
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    /*
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
 */
    guard let secondVC2 = self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
    present(secondVC2, animated: true, completion: nil)
  }
}
