//
//  CacheManager.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import SQLite

class CacheManager {
    enum cacheType {
        case sqlite
    }
    
    static func create(_ type: cacheType) -> CacheService {
        switch type {
        case .sqlite: return SqliteCache()
        }
    }
}
