//
//  DetailViewController.swift
//  1019tTbleView
//
//  Created by okkoung on 2017. 10. 20..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var backgroundImgView: UIImageView!
  @IBOutlet weak var nameLB: UILabel!
  @IBOutlet weak var profilImgView: UIImageView!
  @IBOutlet weak var descriptionLB: UITextView!
  @IBOutlet weak var phoneLB: UILabel!
  @IBOutlet weak var emailLB: UILabel!
  
  var data: ProfileModel?
  
  override func viewDidLoad() {
        super.viewDidLoad()

    if let real = data {
      nameLB.text = real.nickName
      descriptionLB.text = real.myProfiledesc
      phoneLB.text = real.phoneNum
      emailLB.text = real.email
      backgroundImgView.image = UIImage(named:real.backgroundImg)
      profilImgView.image = UIImage(named: real.profileImg)
      
    }
    profilImgView.layer.cornerRadius = profilImgView.bounds.size.width / 2
    profilImgView.layer.borderColor = UIColor.lightGray.cgColor
    profilImgView.layer.borderWidth = 1
    profilImgView.clipsToBounds = true
    
    
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
