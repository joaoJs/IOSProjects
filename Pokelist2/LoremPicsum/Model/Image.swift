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

struct PokeInfo: Codable {
    var types: [Type]
    var abilities: [Ability]
    var moves: [Move]
    
    enum CodingKeys: String, CodingKey {
        case types, abilities, moves
    }
}

struct Type: Codable {
    var slot: Int
    var type: NameLink
    
    enum CodingKeys: String, CodingKey {
        case slot, type
    }
}

struct Ability: Codable {
    var ability: NameLink
    
    enum CodingKeys: String, CodingKey {
        case ability
    }
}

struct Move: Codable {
    var move: NameLink
    
    enum CodingKeys: String, CodingKey {
        case move
    }
}

struct NameLink: Codable {
    var name: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
}

struct PokeInfoCached {
    var types: [Type]
    var abilities: [Ability]
    var moves: [Move]
    //var sprite: UIImage?
    
    init(pokeInfo: PokeInfo) {
        self.types = pokeInfo.types
        self.abilities = pokeInfo.abilities
        self.moves = pokeInfo.moves
    }
}
