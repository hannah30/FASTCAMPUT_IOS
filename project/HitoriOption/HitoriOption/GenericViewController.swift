//
//  GenericViewController.swift
//  HitoriOption
//
//  Created by okkoung on 2017. 10. 25..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

struct queue<K> {
  var queueArray:[K] = []
  mutating func enqueQueue(_ data:K) {
    queueArray.append(data)
  }
  mutating func dequeQueue() -> K {
    return queueArray.removeFirst()
  }
}
