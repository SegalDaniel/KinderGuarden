//
//  AuthorizedAccompanist+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 27/03/2019.
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
    @NSManaged public var child: Child?

}
