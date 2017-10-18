//
//  albuminfo.swift
//  1017DataModel2
//
//  Created by okkoung on 2017. 10. 17..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

struct AlbumInfo {
  var albumtitle: String
  var artist: String
  var genre: String
  
  init?(albumdata:[String: Any]) {
    guard let albumtitle = albumdata["albumtitle"] as? String else{return nil}
    self.albumtitle = albumtitle
    guard let artist = albumdata["artist"] as? String else{return nil}
    self.artist = artist
    guard let genre = albumdata["genre"] as? String else{return nil}
    self.genre = genre
  }
  
}
