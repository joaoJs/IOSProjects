import UIKit

final class NetworkManager {
    
    static var shared = NetworkManager()
    
    private init() { }
    
}

extension NetworkManager {
    
    func getPokemonType() -> PokemonType? {
        print("first")
        guard let path = Bundle.main.path(forResource: "SampleJSONDragon", ofType: "json") else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            guard let baseDict = jsonObj as? [String: Any] else { return nil }
            return self.parseDragonType(base: baseDict)
        } catch let myError {
            print(myError.localizedDescription)
        }
        return nil
    }
    
    private func parseDragonType(base: [String: Any]) -> PokemonType? {
        guard let indices = base["game_indices"] as? [[String: Any]] else { return nil }
        
        // indices
        var returnIndices: [GameIndex] = []
        indices.forEach{
            guard let index =  $0["game_index"] as? Int else { return }
            guard let generationDict = $0["generation"] as? [String: Any] else { return }
            guard let generationData = self.createNameLink(dict: generationDict) else { return }
            returnIndices.append(GameIndex(gameIndex: index, generation: generationData))
        }
        print(returnIndices)
        
        // generation
        guard let generation = base["generation"] as? [String: Any] else { return nil }
        guard let returnGen = self.createNameLink(dict: generation) else { return nil }
        
        
        // move damage
        guard let moveDamage = base["move_damage_class"] as? [String: Any] else { return nil }
        guard let returnMoveDam = self.createNameLink(dict: moveDamage) else { return nil }
        
        
        // id
        guard let id = base["id"] as? Int else { return nil }
        
        // moves
        guard let moves = base["moves"] as? [[String: Any]] else { return nil }
    
        var returnMoves: [NameLink] = []
        moves.forEach{
            guard let moveData = self.createNameLink(dict: $0) else { return }
            returnMoves.append(moveData)
        }
        
        
        guard let name = base["name"] as? String else { return nil }
    
        
        // pokemons
        guard let pokemons = base["pokemon"] as? [[String: Any]] else { return nil }
        
        var pokemonList: [Pokemon] = []
        pokemons.forEach{
            guard let pokeDict = $0["pokemon"] as? [String: Any] else { return }
            guard let pokeData = self.createNameLink(dict: pokeDict) else { return }
            guard let slot = $0["slot"] as? Int else { return }
            pokemonList.append(Pokemon(pokemon: pokeData, slot: slot))
        }
        
        
        guard let damageInfoList = base["damage_relations"] as? [String: Any] else { return nil }
        
        guard let doubleFromList = damageInfoList["double_damage_from"] as? [[String: Any]] else { return nil }
    
        var doubleFromListReturn: [NameLink] = []
        doubleFromList.forEach{
            guard let doubleFromData = self.createNameLink(dict: $0) else { return }
            doubleFromListReturn.append(doubleFromData)
        }
        
        
        guard let doubleToList = damageInfoList["double_damage_to"] as? [[String: Any]] else { return nil }
        
        var doubleToListReturn: [NameLink] = []
        doubleToList.forEach{
            guard let doubleToData = self.createNameLink(dict: $0) else { return }
            doubleToListReturn.append(doubleToData)
        }
        
        
        guard let hFromList = damageInfoList["half_damage_from"] as? [[String: Any]] else { return nil }
        
        var hFromListReturn: [NameLink] = []
        hFromList.forEach{
            guard let hFromData = self.createNameLink(dict: $0) else { return }
            hFromListReturn.append(hFromData)
        }
        
        
        guard let hToList = damageInfoList["half_damage_to"] as? [[String: Any]] else { return nil }
        
        var hToListReturn: [NameLink] = []
        hToList.forEach{
            guard let hToData = self.createNameLink(dict: $0) else { return }
            hToListReturn.append(hToData)
        }
        
        
        guard let nFromList = damageInfoList["no_damage_from"] as? [[String: Any]] else { return nil }
        
        var nFromListReturn: [NameLink] = []
        nFromList.forEach{
            guard let nFromData = self.createNameLink(dict: $0) else { return }
            nFromListReturn.append(nFromData)
        }
        
        
        guard let nToList = damageInfoList["no_damage_to"] as? [[String: Any]] else { return nil }
        
        var nToListReturn: [NameLink] = []
        nToList.forEach{
            guard let nToData = self.createNameLink(dict: $0) else { return }
            nToListReturn.append(nToData)
        }
        
        
        let damageTotalInfo: [String: [NameLink]] = ["doubleFrom": doubleFromListReturn, "doubleTo": doubleToListReturn, "halfFrom": hFromListReturn, "halfTo": hToListReturn, "nFrom": nFromListReturn, "nTo": nToListReturn]
        
        
        return PokemonType(damageRelations: damageTotalInfo, gameIndices: returnIndices, generation: returnGen, id: id, moveDamageClass: returnMoveDam, moves: returnMoves, name: name, dragonList: pokemonList)
    }
    
    private func createNameLink(dict: [String: Any]) -> NameLink? {
        guard let name = dict["name"] as? String else { return nil }
        guard let url = dict["url"] as? String else { return nil }
        return NameLink(name: name, url: url)
    }
    
    
}

