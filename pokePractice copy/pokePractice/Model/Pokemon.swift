import UIKit


struct ResponseObj: Codable {
    var results: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Pokemon: Codable {
    
    var name: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
}

struct PokeForm: Codable {
    var sprites: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case sprites
    }
}

