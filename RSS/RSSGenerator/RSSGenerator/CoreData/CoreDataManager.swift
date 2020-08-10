import CoreData

class CoreDataManager {
    
    // MARK: - Stack Set Up
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "album")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Something bad happened")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    // MARK: - Creation Functions
    
//    func makeAlbum() -> album? {
//        let context = self.persistentContainer.viewContext
//        guard let entity = NSEntityDescription.entity(forEntityName: "AlbumFromCoreData", in: context) else { return nil }
//
//        let album = AlbumFromCoreData(entity: entity, insertInto: context)
//        // TODO: Create Kitty Components
//
//        album.
//
//        kitty.tail = self.makeTail()
//        kitty.paws = self.makePaws()
//        kitty.name = self.randomNames.randomElement()
//        kitty.color = self.randomColors.randomElement()
//        
//        return kitty
//    }
    
//    private func makePaws() -> Paws? {
//        let context = self.persistentContainer.viewContext
//        guard let entity = NSEntityDescription.entity(forEntityName: "Paws", in: context) else { return nil }
//
//        let paws = Paws(entity: entity, insertInto: context)
//        paws.beany = Bool.random()
//        paws.sharp = Bool.random()
//
//        return paws
//    }
//
//    private func makeTail() -> Tail? {
//        let context = self.persistentContainer.viewContext
//        guard let entity = NSEntityDescription.entity(forEntityName: "Tail", in: context) else { return nil }
//
//        let tail = Tail(entity: entity, insertInto: context)
//        tail.floofThickness = Double.random(in: 5.0...12.0)
//        tail.length = Double.random(in: 3.0...20.0)
//
//        return tail
//    }
//
//    func fetchKitty() -> KittyKat? {
//        let context = self.persistentContainer.viewContext
//
//        let request: NSFetchRequest<KittyKat> = KittyKat.fetchRequest()
//        do {
//            let results = try context.fetch(request)
//
//            if let kitty = results.first {
//                return kitty
//            }
//        } catch {
//            print(error)
//        }
//        return nil
//    }
//
//    func deleteKitty(_ kitty: KittyKat) {
//        let context = self.persistentContainer.viewContext
//        context.delete(kitty)
//        self.saveContext()
//    }
    
    
}

