//
//  Cough+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 25/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Cough {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cough> {
        return NSFetchRequest<Cough>(entityName: "Cough")
    }

    @NSManaged public var childID: String?
    @NSManaged public var type: String?

}
