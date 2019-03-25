//
//  BasicEvent+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 25/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension BasicEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BasicEvent> {
        return NSFetchRequest<BasicEvent>(entityName: "BasicEvent")
    }

    @NSManaged public var eventType: String?
    @NSManaged public var child: Child?

}
