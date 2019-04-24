//
//  Alert+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 25/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Alert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alert> {
        return NSFetchRequest<Alert>(entityName: "Alert")
    }

    @NSManaged public var alertDate: NSDate?
    @NSManaged public var level: Int16
    @NSManaged public var eventsLeading: String?
    @NSManaged public var actionNeeded: String?
    @NSManaged public var child: Child?

}
