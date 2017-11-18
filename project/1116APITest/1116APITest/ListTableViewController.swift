//
//  ListTableViewController.swift
//  1116APITest
//
//  Created by okkoung on 2017. 11. 17..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController {

  @IBOutlet weak var tv: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      NetworkManager.shard.requestGetPosts { (isSuccess, data, error) in
        print("ok")
      }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
