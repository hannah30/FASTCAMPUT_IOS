
import Foundation

struct PostModel: Codable {
  
  var title: String
  var imgCoverUrl: String
  var content: String?
 
  enum CodingKeys: String, CodingKey {
    case title = "title"
    case content = "content"
    case imgCoverUrl = "img_cover"
  }
}
