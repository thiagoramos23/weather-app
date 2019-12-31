//
//  Location.swift
//  WeatherApp
//
//  Created by Thiago Ramos on 21/12/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation

struct Location {
    var name: String
    var identifierId: Int
    
    init(name: String, identifierId: Int) {
        self.name = name
        self.identifierId = identifierId
    }
}
