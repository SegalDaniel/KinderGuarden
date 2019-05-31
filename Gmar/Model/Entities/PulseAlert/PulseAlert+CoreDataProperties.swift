//
//  PulseAlert+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 31/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension PulseAlert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PulseAlert> {
        return NSFetchRequest<PulseAlert>(entityName: "PulseAlert")
    }

    @NSManaged public var alertDate: NSDate?
    @NSManaged public var alertID: String?

}
