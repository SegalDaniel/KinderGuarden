//
//  FamilyReport+CoreDataProperties.swift
//  Gmar
//
//  Created by Zach Bachar on 10/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension FamilyReport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FamilyReport> {
        return NSFetchRequest<FamilyReport>(entityName: "FamilyReport")
    }

    @NSManaged public var details: String?
    @NSManaged public var eventDate: NSDate?
    @NSManaged public var eventID: String?
    @NSManaged public var topic: String?
    @NSManaged public var child: Child?
    @NSManaged public var staff: Staff?

}
