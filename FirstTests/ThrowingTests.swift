//
//  ThrowingTests.swift
//  FirstTests
//
//  Created by Jason Hilimire on 2/1/19.
//  Copyright © 2019 Peanut Apps. All rights reserved.
//

import XCTest

extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}
enum GameError: LocalizedError {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

struct Game {
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print ("\(name) is OK to play")
        }
    }
}

class ThrowingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        
        do {
            try game.play()
            XCTFail("BioBlitz has not been purchased")
        } catch GameError.notPurchased {
            // success!
        } catch {
            XCTFail()
        }
    }
    
    
    // above function written much cleaner
    func testPlayingBlastzapThrows() {
        let game = Game(name: "Blastazap")
        
        XCTAssertThrowsError(try game.play()) {
            error in XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    // test no error is thrown
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeyes")
        
        XCTAssertNoThrow(try game.play())
    }
    
    func testCrashyPlaneDoesntThrow() throws {
        let game = Game(name: "Crashy Plane")
        try game.play()
    }
    
    func testDeadStormThrows() {
        let game = Game(name: "Dead Storm Rising")
        
        XCTAssertThrowsError(try game.play())
    }

}
