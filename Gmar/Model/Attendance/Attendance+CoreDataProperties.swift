//
//  Attendance+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 25/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Attendance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Attendance> {
        return NSFetchRequest<Attendance>(entityName: "Attendance")
    }

    @NSManaged public var childID: String?
    @NSManaged public var isLate: Bool
    @NSManaged public var type: String?
    @NSManaged public var authorized: AuthorizedAccompanist?

}
