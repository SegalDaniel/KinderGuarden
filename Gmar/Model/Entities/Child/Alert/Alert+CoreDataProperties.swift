//
//  Alert+CoreDataProperties.swift
//  Gmar
//
//  Created by Zach Bachar on 08/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Alert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alert> {
        return NSFetchRequest<Alert>(entityName: "Alert")
    }

    @NSManaged public var actionNeeded: String?
    @NSManaged public var alertDate: NSDate?
    @NSManaged public var eventsLeading: String?
    @NSManaged public var level: Int16
    @NSManaged public var type: Int16
    @NSManaged public var alertID: String?
    @NSManaged public var child: Child?

}
