//
//  DivisionTests.swift
//  FirstTests
//
//  Created by Jason Hilimire on 1/31/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest
@testable import First
var aut: Division!

class DivisionTests: XCTestCase {

    override func setUp() {
       aut = Division()
    }

    override func tearDown() {
       aut = nil
    }

    func testDivisors() {
        // given
        let dividend = 10
        let divisor = 3
        
        // when
        let result = aut.divisionRemainder(of: dividend, dividedBy: divisor)
        
        // then
        XCTAssertEqual(result.quotient, 3)
        XCTAssertEqual(result.remainder, 1)
    }
    
    func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line ) {
        XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
        XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
    }
    
    func testVerifyDivisorsUsingMethod() {
        // given
        let dividend = 10
        let divisor = 3
        
        // when
        let result = aut.divisionRemainder(of: dividend, dividedBy: divisor)
        
        // then
        verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
    }

}
