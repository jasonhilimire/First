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
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
}
