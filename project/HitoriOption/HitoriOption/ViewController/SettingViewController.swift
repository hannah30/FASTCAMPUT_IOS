

import UIKit

enum MenuType {
  case InfoMenu
  case changePW
  case Logout
  case Non
}

class SettingViewController: UIViewController {

  @IBOutlet weak var settingTableView: UITableView!
  var dataManager:SettingManager = SettingManager()
  
    override func viewDidLoad() {

      super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SettingViewController : UITableViewDelegate, UITableViewDataSource{
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return dataManager.settingData.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let sectionNum = dataManager.settingData[section]
    return sectionNum.rowCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sectionData = dataManager.settingData[indexPath.section]
    let rowData = sectionData.rows[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
    cell.cellData = rowData
    
    if indexPath.section == 1 && indexPath.row == 0 {
      cell.showingVersion()
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let menuType = settingMenuType(section: indexPath.section, row: indexPath.row)
    
    switch menuType {
    case .InfoMenu :
      
      performSegue(withIdentifier: "ProfileInfo", sender: nil)
//      let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//      let nextVC = storyboard.instantiateViewController(withIdentifier: "ProfileInfo")
//      self.navigationController?.pushViewController(nextVC, animated: true)
      
    case .changePW :
      
      print("changepw")
      let alretVC = UIAlertController(title: "ChangePassword", message: " 패스워드 변경하시겠습니까?", preferredStyle: .alert)
      alretVC.addTextField(configurationHandler: { (tf) in
        tf.placeholder = ""
      })
      let alretOkAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
        ///// 변경하겠다고 할때 해야할일
      
      })
      let alretCancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
      
      alretVC.addAction(alretOkAction)
      alretVC.addAction(alretCancelAction)
      
      self.present(alretVC, animated: true, completion: nil)
      
    case .Logout:
      
      let alretVC = UIAlertController(title: "Logout", message: " 정말 로그아웃?", preferredStyle: .alert)
      let alretOkAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
        /////로그아웃이 되었을 경우 해야 할일
      })
      let alretCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
      alretVC.addAction(alretOkAction)
      alretVC.addAction(alretCancelAction)
      
      self.present(alretVC, animated: true, completion: nil)
      
    default :
      print("nothing")
      
    }
  }
  func settingMenuType (section: Int, row: Int) -> MenuType {
    if section == 0 {
      if row == 0
      { return MenuType.InfoMenu }
      if row == 1
      { return MenuType.changePW }
      if row == 2
      { return MenuType.Logout }
    }
    return MenuType.Non
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let sectionData = dataManager.settingData[section]
    return sectionData.sectionTitle
  }
}
