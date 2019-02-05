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

    func testPrimesUpTo100ShouldBeEqual25(){
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
    
    func testPrimesUpTo100ShouldBe25() {
        //given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25
        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
    
    func testPrimesUpTo100ShouldBe25_fullfillmentCount() {
        // given
        let maximumCount = 100
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        var primeCounter = 0
        
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount) and then stop")
        expectation.expectedFulfillmentCount = 25
        
        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in XCTAssertEqual(primes[primeCounter], number)
            expectation.fulfill()
            primeCounter += 1
        }
        wait(for: [expectation], timeout: 3)
 
    }
    
    func testPrimesUpTo100ShouldBe25_Progress() {
        // given
        let maximumCount = 100
        
        // when
        let progress = PrimeCalculator.calculate_Progress(upTo: maximumCount) {
            XCTAssertEqual($0.count, 25)
        }
        
        // then
        let predicate = NSPredicate(
            format: "%@.completedUnitCount == %@", argumentArray: [progress, maximumCount]
        )
        
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
        wait(for: [expectation], timeout: 10)
    }
    
    func testPrimePerformance() {
        measure {
            _ = PrimeCalculator.calculatePerformance(upTo: 1_000_000)
        }
    }
    
    

}
