

import Foundation

class DataCenter {
  
  static var mainCenter: DataCenter = DataCenter()
  var nameList:[String] = []
  let UserNameFile = "UserNameFile.plist"
  private init() {
    loadNameList()
  }
  
  func loadNameList() {
    //plist에서 데이터 불러와서 네임리스트에 할당
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/" + UserNameFile
    if let list = NSArray(contentsOfFile: docPath) as? [String] {
      self.nameList = list
    }

  }
  
  func addName(_ name: String) {
    self.nameList.append(name)
    saveNameList()
  }
  
  func saveNameList() {
    let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/" + UserNameFile
    NSArray(array: nameList).write(toFile: docPath, atomically: true)
  }
  
}
