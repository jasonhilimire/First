//
//  NotificationTests.swift
//  FirstTests
//
//  Created by Jason Hilimire on 2/4/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest
@testable import First

class NotificationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserUpgradedPostsNotification() {
        // given
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification)
        
        // when
        user.upgrade()
        
        //then
        wait(for: [expectation], timeout: 3)
        
    }
    
    func testUserUpgradedLevelsPostsNotifications() {
        // given
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification)
        
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }
            if level == "gold" {
                return true
            } else {
                return false
            }
        }
        // when
        user.upgradeLevels()
        
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testUserUpgradedPostsNotificationToCustomCenter() {
        // given
        let center = NotificationCenter()
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification, object: nil, notificationCenter: center)
        
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }
            if level == "gold" {
                return true
            } else {
                return false
            }
        }
        
        // when
        user.upgradeLevels(using: center)
        
        // then
        wait(for: [expectation], timeout: 3)
    }

}
