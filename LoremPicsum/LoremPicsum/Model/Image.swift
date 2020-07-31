import UIKit

struct Image: Codable {
    
    var id: String
    var author: String
    var width: Int
    var height: Int
    var imgUrl: String
    var downloadUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height
        case imgUrl = "url"
        case downloadUrl = "download_url"
    }
}
