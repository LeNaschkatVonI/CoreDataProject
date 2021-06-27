//
//  Games+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Максим Нуждин on 27.06.2021.
//
//

import Foundation
import CoreData


extension Games {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Games> {
        return NSFetchRequest<Games>(entityName: "Games")
    }

    @NSManaged public var title: String?
    @NSManaged public var genre: String?

    var wrappedTitle: String {
        title ?? "unknown title"
    }
    
    var wrappedGenre: String {
        genre ?? "unknown genre"
    }
}

extension Games : Identifiable {

}
