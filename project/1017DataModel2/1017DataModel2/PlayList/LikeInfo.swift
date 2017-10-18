//
//  LikeInfo.swift
//  1017DataModel2
//
//  Created by okkoung on 2017. 10. 17..
//  Copyright © 2017년 okkoung. All rights reserved.
//

enum PlayListType
{
  case origin
  case custom
}
struct PlayList
{
  var type:PlayListType
  var id:Int
  var title:String
  var mainImgURL:String?
  var thumbImgURL:String?
  var totalSongCount:Int
  var isPremium:Bool
  var date:Date?
  init?(data:[String:Any])
  {
    if let id = data["id"] as? Int
    {
      self.type = .origin
      self.id = id
    }else if let id = data["upid"] as? Int
    {
      self.type = .custom
      self.id = id
    }else
    {
      return nil
    }
    
    guard let title = data["title"] as? String else {return nil}
    self.title = title
    
    self.mainImgURL = data["main_img_url"] as? String
    self.thumbImgURL = data["thumb_img_url"] as? String
    self.totalSongCount = data["song_cnt"] as? Int ?? 0
    
    if let premium = data["isPremium"] as? String,
      (premium == "Y" || premium == "N")
    {
      self.isPremium = premium == "y" ? true : false
    }else
    {
      self.isPremium = false
    }
    
    guard let date = data["monthly_ym"] as? Int else { return nil}
    
    let year = date/100
    let month = date%100
    let calender = Calendar(identifier: .gregorian)
    
    var components = DateComponents()
    components.year = year
    components.month = month
    
    self.date = calender.date(from: components)
    
    print(date)
  }
}

