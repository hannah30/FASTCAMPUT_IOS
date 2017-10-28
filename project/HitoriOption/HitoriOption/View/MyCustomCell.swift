//
//  MyCustomCell.swift
//  HitoriOption
//
//  Created by okkoung on 2017. 10. 24..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

  
  var cellData:SettingCellDataModel? {
    willSet {
      textLabel?.text = newValue!.cellTitle
      self.type = newValue!.cellStyle
    }
  }
  var type: CellType = .baseType {
    didSet {
      changeTypeUI()
    }
  }
  
  func changeTypeUI() {
    switch type {
    case .baseType :
      self.accessoryType = .none
      self.selectionStyle = .none
      settingSwitch.isHidden = true
      settingLabel.isHidden = true
      
    case .detailType :
      self.accessoryType = .disclosureIndicator
      settingSwitch.isHidden = true
      settingLabel.isHidden = true
      
    case .switchType :
      self.accessoryType = .none
      self.selectionStyle = .none
      settingSwitch.isHidden = false
      settingLabel.isHidden = true
      
    case .buttonType :
      self.accessoryType = .none
      settingSwitch.isHidden = true
      settingLabel.isHidden = true
      self.textLabel?.textColor = UIColor.red
    }
  }
  
  @IBOutlet weak var settingSwitch: UISwitch!
  @IBOutlet weak var settingLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
      settingLabel.isHidden = true
      settingSwitch.isHidden = true
      self.accessoryType = .none
    }
  
  func showingVersion() {
    settingLabel.isHidden = false
    
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    settingLabel.text = version
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
