import UIKit

final class ImagesDict {

    static let shared = ImagesDict()
    
    var imagesDict: [String: UIImage]
    
    private init(dictionary: [String: UIImage] = [:]) {
        self.imagesDict = dictionary
    }
    
}

