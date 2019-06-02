//
//  JsonParsing.swift
//  Gmar
//
//  Created by Zach Bachar on 02/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import CoreData

extension ModelHttp{
    
    func fetch(entityName:String) -> [BasicEvent]?{
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        return try! Model.instance.managedContext.fetch(fetch) as! [BasicEvent]
    }
    
    func parseAttandanceEvents(jsonArr:NSArray){
        var events:[Attendance] = []
        let olds = fetch(entityName: "Attendance") as! [Attendance]
        jsonArr.forEach { (jsonAttendance) in
            let jAtt = jsonAttendance as! [String:Any]
            var exist = false
            olds.forEach({ (old) in
                exist = old == jAtt
            })
            if !exist{
                events.append(Attendance(json: jAtt))
            }
        }
    }
}
