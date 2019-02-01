//
//  Converter.swift
//  First
//
//  Created by Jason Hilimire on 1/31/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5 / 9
    }
}
