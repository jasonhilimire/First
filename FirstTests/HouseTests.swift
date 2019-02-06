//
//  HouseTests.swift
//  FirstTests
//
//  Created by Jason Hilimire on 2/5/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest
@testable import First

class HouseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test4Bed2BathHouse_Fits3Bed2BathRequirements() {
        // given
        let house = House(bedrooms: 4, bathrooms: 2)
        let desiredBedrooms = 3
        let desiredBathrooms = 2
        
        // when
        let suitability = house.checkSuitability(desiredBedrooms: desiredBedrooms, desiredBathrooms: desiredBathrooms)
        
        // then
        XCTAssertTrue(suitability)
    }

}
