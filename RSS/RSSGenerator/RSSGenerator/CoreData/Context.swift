import CoreData
import UIKit

class Context {
    
    static let shared = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
}
