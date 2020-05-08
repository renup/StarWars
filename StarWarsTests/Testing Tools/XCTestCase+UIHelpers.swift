//
//  XCTestCase+UIHelpers.swift
//  StarWarsTests
//
//  Created by Renu Punjabi on 5/7/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func waitForNextRunLoop() {
        let expectation = self.expectation(description: "Wait for next run loop")
        OperationQueue.main.addOperation {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
