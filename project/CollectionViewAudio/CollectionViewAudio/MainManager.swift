

import Foundation
import UIKit
import AVFoundation

class MainManager {

  static var mainManager: MainManager = MainManager()
  var audioManager: [AudioManager] = []
  
  init() {
    loadData()
  }

  func loadData() {
    
    for i in 0 ..< 30 {
      if let url = Bundle.main.url(forResource: "\(i)", withExtension: "mp3") {
        let asset = AVURLAsset(url: url)
        let metaData:[AVMetadataItem] = asset.metadata
        var data = AudioManager(metaData: metaData)
        data.url = url
        audioManager.append(data)
        
        }
        
      }
    }
  }
  


//class DataCenter {
//  
//  static var main:DataCenter = DataCenter()
//  var albumList:[AlbumDataModel] = []
//  
//  private init() {
//    loadSongData()
//  }
//  
//  func loadSongData() {
//    for i in 0..<30 {
//      if let url = Bundle.main.url(forResource: "\(i)", withExtension: "mp3")
//      {
//        let asset = AVURLAsset(url: url)
//        let metaData:[AVMetadataItem] = asset.metadata
//        albumList.append(AlbumDataModel(data: metaData))
//      }
//    }
//  }
//  
//  
//  
//}


