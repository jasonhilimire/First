//
//  File.swift
//  First
//
//  Created by Jason Hilimire on 2/4/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import Foundation

struct User {
    static let upgradedNotification = Notification.Name("UserUpgraded")
    
    func upgrade() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            let center = NotificationCenter.default
            center.post(name: User.upgradedNotification, object: nil)
        }
    }
    
    func upgradeLevels(using center: NotificationCenter = NotificationCenter.default) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: User.upgradedNotification, object: nil, userInfo: ["level": "gold"])
        }
    }
}
