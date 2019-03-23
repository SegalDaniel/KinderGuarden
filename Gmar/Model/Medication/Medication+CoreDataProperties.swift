//
//  Medication+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Medication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medication> {
        return NSFetchRequest<Medication>(entityName: "Medication")
    }

    @NSManaged public var childID: String?
    @NSManaged public var details: String?
    @NSManaged public var eventDate: NSDate?
    @NSManaged public var type: String?
    @NSManaged public var child: Child?

}
