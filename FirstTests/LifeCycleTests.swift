//
//  LifeCycleTests.swift
//  FirstTests
//
//  Created by Jason Hilimire on 1/31/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest

class LifeCycleTests: XCTestCase {

    override class func setUp() {
        print("In Class setUp")
    }

    override class func tearDown() {
        print("In Class tearDown")
    }

    override func setUp() {
        print("In setUp")
    }
    
    override func tearDown() {
        print("In tearDown")
    }
    
    func testExample() {
        print("Starting test")
        
        addTeardownBlock {
            print(" In first tearDown block")
        }
        print("In middle of test")
        
        addTeardownBlock {
            print("In second tearDown block")
        }
        print("finishing test")
    }

}
