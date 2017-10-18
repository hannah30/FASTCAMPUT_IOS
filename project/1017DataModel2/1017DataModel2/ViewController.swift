//
//  ViewController.swift
//  1017DataModel2
//
//  Created by okkoung on 2017. 10. 17..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let path = Bundle.main.path(forResource: "UserList", ofType: "plist"),
      let dic = NSDictionary(contentsOfFile: path) as? [String: Any]{
        let songUser = AlbumInfo(albumdata: dic)
        
      }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

