

import Foundation
class MusicDataManager
{
  var songDatas:[SongDataModel] = []
  
  init() {
    loadData()
  }
  
  
  func loadData()
  {
    for i in 0...29
    {
      if let model = SongDataModel(fileName: "\(i)")
      {
        songDatas.append(model)
      }
    }
  }
  
}

