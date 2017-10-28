//
//  ProfileViewController.swift
//  HitoriOption
//
//  Created by okkoung on 2017. 10. 25..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @IBOutlet weak var mainSV: UIScrollView!
  
  @IBOutlet weak var firstProfileImg: UIImageView!
  
  @IBOutlet weak var userNameLB: UILabel!
  @IBOutlet weak var profileImg: UIImageView!
  @IBOutlet weak var nickNameLB: UILabel!
  @IBOutlet weak var feelingLB: UILabel!
  @IBOutlet weak var birthdayLB: UILabel!
  @IBOutlet weak var phoneNumberLB: UILabel!
  @IBOutlet weak var emailLB: UILabel!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
      
      firstProfileImg.layer.cornerRadius = firstProfileImg.bounds.size.width/2
      firstProfileImg.layer.borderColor = #colorLiteral(red: 0.7176470588, green: 0.6549019608, blue: 0.6235294118, alpha: 1)
      firstProfileImg.layer.borderWidth = 1
      firstProfileImg.clipsToBounds = true
      
      NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil)  { (noti) in
        if let keyboard = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
          self.mainSV.contentOffset = CGPoint(x: 0, y: keyboard.height)
        }
      }
      NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (noti) in
        self.mainSV.contentOffset = CGPoint(x: 0, y: 0)
      }
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func modifyImgAction(_ sender: Any) {
    
    let actionSheet = UIAlertController(title: "사진고르기", message: "사진골라주세요", preferredStyle: .actionSheet)
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      
      let camera = UIAlertAction(title: "camera", style: .default) { (action) in
        
        let imgPicker = UIImagePickerController()
        imgPicker.sourceType = .camera
        imgPicker.delegate = self
        self.present(imgPicker, animated: true, completion: nil)
      }
      actionSheet.addAction(camera)
      
    }
    
    
    let photo = UIAlertAction(title: "album", style: .cancel) { (action) in
      
      let imgPicker = UIImagePickerController()
      imgPicker.sourceType = .savedPhotosAlbum
      imgPicker.delegate = self
      self.present(imgPicker, animated: true, completion: nil)
    }
    actionSheet.addAction(photo)
    
    self.present(actionSheet, animated: true, completion: nil)
    
    
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
      firstProfileImg.image = img
    }
    
    if let url = info[UIImagePickerControllerImageURL] as? URL {
      if let data = try? Data(contentsOf: url) {
        firstProfileImg.image = UIImage(data: data)
      }
    }
    picker.dismiss(animated: true, completion: nil)
  }

}



