//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Максим Нуждин on 28.06.2021.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown candy"
    }
}

extension Candy : Identifiable {

}
