//
//  AlbumModel.swift
//  1017DataModel2
//
//  Created by okkoung on 2017. 10. 17..
//  Copyright © 2017년 okkoung. All rights reserved.
//


struct AlbumModel {
  var albumInfo: AlbumInfo
  var songList: [SongList] = []
  
  init?(dataDic:[String: Any]) {
    guard let albumInfo = dataDic["AlbumInfo"] as? Dictionary<String, Any> else{return nil}
    self.albumInfo = AlbumInfo(albumdata: albumInfo)!
    guard let list = dataDic["SongList"] as? [Dictionary<String, Any>] else{return nil}
    for songDic in list {
      songList.append(SongList(SongData: songDic)!)
    }
  }
  
}
