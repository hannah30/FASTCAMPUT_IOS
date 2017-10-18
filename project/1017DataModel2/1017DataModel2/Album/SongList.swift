//
//  SongList.swift
//  1017DataModel2
//
//  Created by okkoung on 2017. 10. 17..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

struct SongList {
  var songTitle: String
  var trackNum: Int
  var artist: String
  var writer: String
  var playTime: Int
  var playURL: String
  
  init?(SongData:[String: Any]) {
    guard let songTitle = SongData["songTitle"] as? String else{return nil}
    self.songTitle = songTitle
    guard let trackNum = SongData["trackNum"] as? Int else{return nil}
    self.trackNum = trackNum
    guard let artist = SongData["artist"] as? String else{return nil}
    self.artist = artist
    guard let writer = SongData["writer"] as? String else{return nil}
    self.writer = writer
    guard let playTime = SongData["playTime"] as? Int else{return nil}
    self.playTime = playTime
    guard let playURL = SongData["playURL"] as? String else{return nil}
    self.playURL = playURL
  }
}

