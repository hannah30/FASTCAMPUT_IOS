

import UIKit

class TextfieldInPutViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var mainTitleImgView: UIImageView!
  @IBOutlet weak var titleInputTextField: UITextField!
  @IBOutlet weak var imScrollView: UIScrollView!
  
  let photoPicker = UIImagePickerController()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    photoPicker.delegate = self
    
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }

 
    
  @IBAction func pickerPhotoBtn(_ sender: UIButton) {
    photoPicker.allowsEditing = false
    photoPicker.sourceType = .photoLibrary
    
    present(photoPicker, animated: true, completion: nil)
  }

  @objc func keyboardWillShow(notification: Notification) {
    imScrollView.contentInset = UIEdgeInsetsMake(0, 0, 500, 0)
  }
  
  @objc func keyboardWillHide(notification: Notification) {
    imScrollView.contentSize = .zero
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let pikingImg = info[UIImagePickerControllerOriginalImage] as?
      UIImage {
      mainTitleImgView.image = pikingImg
    }
    dismiss(animated: true, completion: nil)
  }
}

//extension TextfieldInPutViewController: UITextFieldDelegate {
//  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//    let allowCharacters = CharacterSet.
//    let characterSet = CharacterSet(charactersIn: string)
//    return allowCharacters.isSuperset(of: characterSet)
//  }
//}

