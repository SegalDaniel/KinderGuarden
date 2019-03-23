//
//  AuthorizedAccompanist+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension AuthorizedAccompanist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AuthorizedAccompanist> {
        return NSFetchRequest<AuthorizedAccompanist>(entityName: "AuthorizedAccompanist")
    }

    @NSManaged public var childID: String?
    @NSManaged public var eventDate: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var relation: String?
    @NSManaged public var child: Child?
    @NSManaged public var attendance: Attendance?

}
