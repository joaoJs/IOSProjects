//
//  GenreModelNew+CoreDataProperties.swift
//  RSSGenerator
//
//  Created by Joao Campos on 8/9/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//
//

import Foundation
import CoreData


extension GenreModelNew {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenreModelNew> {
        return NSFetchRequest<GenreModelNew>(entityName: "GenreModelNew")
    }

    @NSManaged public var name: String?
    @NSManaged public var album: AlbumModel?

}
