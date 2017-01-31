//
//  DataStorage.swift
//  WhereWasI
//
//  Created by Dan Lindsay on 2017-01-31.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

struct StorageKeys {
    
    static let storedLat = "storedLat"
    static let storedLong = "storedLong"
}

class DataStorage {
    
    func getDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func storeDataPoint(latitude: String, longitude: String) {
        let defaults = getDefaults()
        
        defaults.set(latitude, forKey: StorageKeys.storedLat)
        defaults.set(longitude, forKey: StorageKeys.storedLong)
        
        defaults.synchronize()
        
        print(latitude + " : " + longitude)
    }
}
