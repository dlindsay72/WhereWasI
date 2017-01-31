//
//  VisitedPoint.swift
//  WhereWasI
//
//  Created by Dan Lindsay on 2017-01-31.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

class VisitedPoint {
    
    private var _latitude: String
    private var _longitude: String
    
    public var latitude: String {
        return _latitude
    }
    
    public var longitude: String {
        return _longitude
    }
    
    init(lat: String, long: String) {
        self._latitude = lat
        self._longitude = long
    }
    
    
    
    
}
