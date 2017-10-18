
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  var list: [UIButton] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    
    creatBtn()
    
  }
  func creatBtn(){
    
    for index in 0 ..< 9 {
     let btn = UIButton(type: .custom)
      btn.tag = index
      let width = view.frame.size.width / 3
      let row = index % 3
      let col = index / 3
      btn.backgroundColor = .blue
      btn.layer.borderColor = UIColor.black.cgColor
      btn.layer.borderWidth = 1
      btn.frame = CGRect(x: CGFloat(row) * width, y: CGFloat(col) * width, width: width, height: width)
      btn.addTarget(self, action: #selector(changColor(sender:)), for: .touchUpInside)
      view.addSubview(btn)
      list.append(btn)
    }
  }
  @objc func changColor(sender: UIButton){
    if sender.tag / 2 == 0 {
        sender.backgroundColor = .yellow
  }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
