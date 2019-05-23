//
//  AuthorizedAccompanist+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension AuthorizedAccompanist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AuthorizedAccompanist> {
        return NSFetchRequest<AuthorizedAccompanist>(entityName: "AuthorizedAccompanist")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var relation: String?
    @NSManaged public var authorizeId: String?
    @NSManaged public var attandance: NSSet?
    @NSManaged public var child: Child?

}

// MARK: Generated accessors for attandance
extension AuthorizedAccompanist {

    @objc(addAttandanceObject:)
    @NSManaged public func addToAttandance(_ value: Attendance)

    @objc(removeAttandanceObject:)
    @NSManaged public func removeFromAttandance(_ value: Attendance)

    @objc(addAttandance:)
    @NSManaged public func addToAttandance(_ values: NSSet)

    @objc(removeAttandance:)
    @NSManaged public func removeFromAttandance(_ values: NSSet)

}
