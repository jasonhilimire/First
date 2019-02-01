//
//  Hater.swift
//  First
//
//  Created by Jason Hilimire on 1/31/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import Foundation

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
    
    mutating func hadAGoodDay() {
        hating = false
    }
}
