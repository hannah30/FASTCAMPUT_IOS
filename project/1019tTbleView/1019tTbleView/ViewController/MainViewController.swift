//
//  MainViewController.swift
//  1019tTbleView
//
//  Created by okkoung on 2017. 10. 20..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  
  @IBOutlet weak var mainTableView: UITableView!
  lazy var dataManager: ProfileDataManager = ProfileDataManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      //여기서 인스턴스해줘도 되지만 위에처럼 lazy로 써주는게 좋다
    //  dataManager = ProfileDataManager()
      mainTableView.reloadData()
        // Do any additional setup after loading the view.
    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataManager.profilesData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
    let profileModel: ProfileModel = dataManager.profilesData[indexPath.row]
    cell.data = profileModel
    cell.textLabel?.text = profileModel.nickName
    cell.detailTextLabel?.text = profileModel.statusDesc
    cell.imageView?.image = UIImage(named: profileModel.profileImg)
    return cell
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let cell = sender as? ProfileTableViewCell else { return }
    guard let nextVC = segue.destination as? DetailViewController else { return }
    nextVC.data = cell.data
  }
}
