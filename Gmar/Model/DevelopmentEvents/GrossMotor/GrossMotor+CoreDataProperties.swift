//
//  GrossMotor+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 30/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension GrossMotor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GrossMotor> {
        return NSFetchRequest<GrossMotor>(entityName: "GrossMotor")
    }

    @NSManaged public var month: String?
    @NSManaged public var type: String?

}
