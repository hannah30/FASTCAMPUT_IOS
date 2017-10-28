//
//  SettingCellDataModel.swift
//  HitoriOption
//
//  Created by okkoung on 2017. 10. 24..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

struct SectionDataModel {
  var sectionTitle: String
  var rows: [SettingCellDataModel] = []
  var rowCount: Int {
    return rows.count
  }
  
  init? (data: [String:Any]) {
    sectionTitle = data["SectionTitle"] as? String ?? ""
    if let list = data["Data"] as? [[String: String]]{
      for listData in list {
        if let model = SettingCellDataModel(data: listData) {
          rows.append(model)
        }
      }
    } else {
      return
    }
  }
}
struct SettingCellDataModel {
  var cellStyle:CellType
  var cellTitle: String
  
  init? (data: [String: String]) {
    guard let styleID = data["CellStyle"] else { return nil }
    self.cellStyle = CellType(rawValue:styleID) ?? .baseType
    guard let title = data["Content"] else { return nil }
    self.cellTitle = title
  }
  
}

enum CellType: String {
  case baseType = "SettingBasicCell"
  case detailType = "SettingDetailCell"
  case switchType = "SettingSwitchCell"
  case buttonType = "SettingButtonCell"
}
