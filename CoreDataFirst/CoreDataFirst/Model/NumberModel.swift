import UIKit

struct NumberModel {
    
    var data: String
    
    init(data: Int) {
        self.data = "\(data)"
    }
    
    init(data: String) {
        self.data = data
    }
    
}
