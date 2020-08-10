import UIKit
import CoreData

final class GlobalContext {

    static let shared = GlobalContext()
    
    var context: NSManagedObjectContext
    //var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init(context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext) {
        self.context = context
    }
    
}
