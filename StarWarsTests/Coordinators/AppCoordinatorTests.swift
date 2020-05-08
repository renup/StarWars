//
//  AppCoordinatorTests.swift
//  StarWarsTests
//
//  Created by Renu Punjabi on 5/7/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import XCTest
@testable import StarWars

class AppCoordinatorTests: XCTestCase {
    var appCoordinator: AppCoordinator!

    override func setUpWithError() throws {
        appCoordinator = AppCoordinator(navigationVC: UINavigationController())
    }

    override func tearDownWithError() throws {
        appCoordinator = nil
    }

    func test_start() {
        appCoordinator.start()
        XCTAssertNotNil(appCoordinator.starWarListCoordinator)
    }

}
