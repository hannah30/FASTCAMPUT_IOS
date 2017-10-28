

import Foundation
import UIKit
import AVFoundation

struct AudioManager {
  
  var title: String = "None"
  var singer: String = "None"
  var titleImg: UIImage = UIImage(named: "Album Cover")!
  var url: URL?
  
  init(metaData: [AVMetadataItem]) {
    
    
      for item in metaData {
        if let key = item.commonKey?.rawValue {
          print(key)
          switch key {
          case "title":
            self.title = item.value as? String ?? "None"
          case "artist":
            self.singer = item.value as? String ?? "None"
          case "artwork":
            let data = item.dataValue!
            self.titleImg = UIImage(data:data) ?? UIImage(named: "Album Cover")!
          default:
            print("noting")
          }
        }
      }
  }
}

