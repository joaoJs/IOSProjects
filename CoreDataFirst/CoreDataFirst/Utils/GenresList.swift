import UIKit

final class GenresList {
    
    static let shared = GenresList()
    
    var genres: [Genre]
    
    private init(genresList: [Genre] = []) {
        self.genres = genresList
    }
    
}
