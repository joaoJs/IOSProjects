import UIKit

final class FavoritesDict {

    static let shared = FavoritesDict()
    
    var favoritesDict: [String: Bool]
    
    private init(dictionary: [String: Bool] = [:]) {
        self.favoritesDict = dictionary
    }
    
}

