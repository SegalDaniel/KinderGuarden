//
//  Rash+CoreDataProperties.swift
//  
//
//  Created by Daniel Segal on 20/03/2019.
//
//

import Foundation
import CoreData


extension Rash {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rash> {
        return NSFetchRequest<Rash>(entityName: "Rash")
    }

    @NSManaged public var childID: String?
    @NSManaged public var type: String?
    @NSManaged public var area: String?

}
