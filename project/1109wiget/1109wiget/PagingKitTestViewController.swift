//
//  PagingKitTestViewController.swift
//  1109wiget
//
//  Created by okkoung on 2017. 11. 9..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class PagingKitTestViewController: UIViewController {

  var menuViewController: PagingMenuViewController!
  var contentViewController: PagingContentViewController!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? PagingMenuViewController {
      menuViewController = vc
    } else if let vc = segue.destination as? PagingContentViewController {
      contentViewController = vc
    }
  }

}
