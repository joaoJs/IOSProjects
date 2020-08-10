//
//  AlbumModel+CoreDataProperties.swift
//  RSSGenerator
//
//  Created by Joao Campos on 8/9/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//
//

import Foundation
import CoreData


extension AlbumModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlbumModel> {
        return NSFetchRequest<AlbumModel>(entityName: "AlbumModel")
    }

    @NSManaged public var artistName: String?
    @NSManaged public var id: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var name: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var genres: GenreModelNew?

}
