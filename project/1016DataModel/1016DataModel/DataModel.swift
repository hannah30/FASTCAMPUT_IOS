//
//  DataModel.swift
//  1016DataModel
//
//  Created by okkoung on 2017. 10. 16..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import Foundation

struct Exhibition {
  var title: String
  var place: String
  var startDay: Date
  var endDay: Date
  var imgURL: String?
  
  init?(ExhibitionData:[String:Any]){
    guard let title = ExhibitionData["title"] as? String else{return nil}
    self.title = title
    guard let place = ExhibitionData["place"] as? String else{return nil}
    
    self.place = place
    
    guard let startDay = ExhibitionData["startDay"] as? String else {return nil}
    let dateformatter = DateFormatter()
    //formatter.dateFormat = "2017년10월16일"
    guard let startdate = dateformatter.date(from: startDay) else {return nil}
    self.startDay = startdate
    
    guard let endDay = ExhibitionData["endDay"] as? String else {return nil}
    guard let endDate = dateformatter.date(from: endDay) else {return nil}
    self.endDay = endDate
    
    self.imgURL = ExhibitionData["imgURL"] as? String
    
    
  }
  
}


