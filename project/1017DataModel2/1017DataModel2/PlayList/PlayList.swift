enum LikeType
{
  case song
  case playlist
  case artist
}
struct likeInfo
{
  var type:LikeType
  var count:Int
  var isLike:Bool
  /*
   - song: object key for song.
   - id: object key (song_id)
   - like_cnt
   - is_like: Y/N
   */
  init?(data:[String:Any])
  {
    if let songData = data["song"] as? [String:Any],
      let dic = songData["id"] as? [String:Any]
    {
      type = .song
      count = dic["like_cnt"] as? Int ?? 0
      if let likeKey = data["like_cnt"] as? String,
        (likeKey == "Y" || likeKey == "N")
      {
        self.isLike = likeKey == "y" ? true : false
      }else
      {
        self.isLike = false
      }
      
    }else if let playlistData = data["up"] as? [String:Any],
      let dic = playlistData["id"] as? [String:Any]
    {
      type = .playlist
      count = dic["like_cnt"] as? Int ?? 0
      
      if let likeKey = data["is_like"] as? String,
        (likeKey == "Y" || likeKey == "N")
      {
        self.isLike = likeKey == "y" ? true : false
      }else
      {
        self.isLike = false
      }
      
    }else if let artistData = data["artist"] as? [String:Any],
      let dic = artistData["id"] as? [String:Any]
    {
      type = .artist
      count = dic["like_cnt"] as? Int ?? 0
      if let likeKey = data["like_cnt"] as? String,
        (likeKey == "Y" || likeKey == "N")
      {
        self.isLike = likeKey == "y" ? true : false
      }else
      {
        self.isLike = false
      }
      
    }else
    {
      return nil
    }
  }
  
  //두번째 방법
  //    init?(data:[String:Any])
  //    {
  //        for (key,value) in data
  //        {
  //            //타입 설정
  //            switch key
  //            {
  //            case "song":
  //                type = .song
  //            case "up":
  //                type = .playlist
  //            case "artist":
  //                type = .artist
  //            }
  //            //벗겨내기
  //            guard let data  = value as? [String:Any],
  //            let dic = data["id"] as? [String:Any] else {return nil}
  //            //실제 데이터 가져오기
  //            count = dic["like_cnt"] as? Int ?? 0
  //            if let likeKey = data["like_cnt"] as? String,
  //                (likeKey == "Y" || likeKey == "N")
  //            {
  //                self.isLike = likeKey == "y" ? true : false
  //            }else
  //            {
  //                self.isLike = false
  //            }
  //        }
  //    }
}
