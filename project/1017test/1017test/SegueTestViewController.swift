//
//  SegueTestViewController.swift
//  1017test
//
//  Created by okkoung on 2017. 10. 10..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class SegueTestViewController: UIViewController {
  
  var isAbleToNext:Bool = true
  
  @IBOutlet weak var textField: UITextField!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func ableToNextSwitch(_ sender: UISwitch) {
    isAbleToNext = sender.isOn
    
  }
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if identifier == "nextSecondVCSegue"{
      return isAbleToNext} else {
      return false
    }
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let sendStr = textField.text ?? "noText"
    let destinationVC = segue.destination as! SecondViewController
    destinationVC.sendMsg(sendStr)
  }
  //unwindsegue
  @IBAction func dismissCompletion(_ sender:UIStoryboardSegue){
    
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
