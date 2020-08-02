import UIKit

//struct PageResult: Codable {
//    var page: Int
//    var totalResults: Int
//    var totalPages: Int
//    var results: [Pokemon]
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalResults = "total_results"
//        case totalPages = "total_pages"
//    }
//}
class ResultsObj: Codable {
    var results: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

class Pokemon: Codable {
    var name: String?
    var url: String?
    //var sprites: [String: String]
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
    
}

class Sprites: Codable {
    var data: [String: String]
    
    init(data: [String:String]) {
        self.data = data
    }
    
    enum CodingKeys: String, CodingKey {
        case data = "sprites"
    }
}
