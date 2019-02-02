//
//  AsynchronousTests.swift
//  AsynchronousTests
//
//  Created by Jason Hilimire on 2/2/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest
@testable import First


class AsynchronousTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrimesUpTo100ShouldBe0(){
        //given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            // then
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
