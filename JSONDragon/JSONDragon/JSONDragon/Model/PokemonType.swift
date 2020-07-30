import Foundation

struct PokemonType {
    var damageRelations: [String: [NameLink]]
    var gameIndices: [GameIndex]
    var generation: NameLink
    var id: Int
    var moveDamageClass: NameLink
    var moves: [NameLink]
    var name: String
    var dragonList: [Pokemon]
}

struct GameIndex {
    var gameIndex: Int
    var generation: NameLink
}

struct Pokemon {
    var pokemon: NameLink
    var slot: Int
}

struct NameLink {
    var name: String
    var url: String
    
}
