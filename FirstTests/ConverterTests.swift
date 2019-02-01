//
//  ConverterTests.swift
//  FirstTests
//
//  Created by Jason Hilimire on 1/31/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest
@testable import First
var sut: Converter!

class ConverterTests: XCTestCase {

    override func setUp() {
      let sut = Converter()
    }

    override func tearDown() {
        sut = nil
    }

    func test32FahrenheitisZeroCelsius() {
        //given
        let input1 = 32.0
        
        //when
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        
        //then
        XCTAssertEqual(output1, 0)
    }
    
    func test212Fahrenheitis100Celsius() {
        //given

        let input2 = 212.0
        
        //when
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        
        //then
        XCTAssertEqual(output2, 100)
    }
    
    

}
