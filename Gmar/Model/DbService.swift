//
//  DbService.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation

class DbService {
    static let cache : CacheService = CacheManager.create(.sqlite)
    
}


protocol CacheService {
    func create(name: String, data: String?, onSuccess: ()->Void, onError: ()->Void)
    func delete(name: String, onSuccess: ()->Void, onError: ()->Void)
    func get(name: String, onSuccess: (Array<[String]>)->Void, onError: ()->Void)
    func save(name: String, dataToSave: [String], onSuccess: ()->Void, onError: ()->Void)
}
