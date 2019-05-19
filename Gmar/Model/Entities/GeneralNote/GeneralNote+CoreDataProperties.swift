//
//  GeneralNote+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 19/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension GeneralNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeneralNote> {
        return NSFetchRequest<GeneralNote>(entityName: "GeneralNote")
    }

    @NSManaged public var eventDate: NSDate?
    @NSManaged public var eventID: Int16
    @NSManaged public var details: String?
    @NSManaged public var child: Child?
    @NSManaged public var staff: Staff?

}
