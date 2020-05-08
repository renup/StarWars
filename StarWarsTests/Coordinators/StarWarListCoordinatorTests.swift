//
//  StarWarListCoordinatorTests.swift
//  StarWarsTests
//
//  Created by Renu Punjabi on 5/7/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import XCTest
@testable import StarWars

class StarWarListCoordinatorTests: XCTestCase {
    
    var coordinatorSpy: StarWarListCoordinatorSpy!

    override func setUpWithError() throws {
        let navigationVC = UINavigationController(rootViewController: StarWarsListViewController())
        coordinatorSpy = StarWarListCoordinatorSpy(navigationController: navigationVC, returnViewController: UIViewController())
        coordinatorSpy.start()
        
    }

    override func tearDownWithError() throws {
        coordinatorSpy = nil
    }
    
    func test_getPeopleList_gets_peopleArray() {
        coordinatorSpy.getPeopleList()
        XCTAssertEqual(coordinatorSpy.peopleArray.count, 10)
        XCTAssertTrue(coordinatorSpy.apiForGetPeopleListCalled)
    }
    
    func test_trigger_filterContent_gets_searchPersonArray() {
        coordinatorSpy.triggerFilterContent()
        XCTAssertEqual(coordinatorSpy.searchPersonArray.count, 1)
        XCTAssertTrue(coordinatorSpy.apiForSearchPersonByNameCalled)
    }
    
    func test_trigger_refreshList_calls_getPeopleList_gets_peopleArray() {
        coordinatorSpy.triggerRefreshList()
        XCTAssertEqual(coordinatorSpy.peopleArray.count, 10)
        XCTAssertTrue(coordinatorSpy.apiForGetPeopleListCalled)
    }

}

final class StarWarListCoordinatorSpy: StarWarListCoordintor {
    var apiForGetPeopleListCalled = false
    var apiForSearchPersonByNameCalled = false
    var apiForPersonDetailCalled = false
    var peopleArray = [People]()
    var searchPersonArray = [People]()
    
    override func getPeopleList() {
        let response = JsonKit().loadJson(of: PeopleResponse.self)
        starWarsListVC?.tableView.peopleList = response!.results
        peopleArray = response!.results
        apiForGetPeopleListCalled = true
    }
    
    override func getPerson(by name: String) {
        let personArray = JsonKit().searchPerson()
        starWarsListVC?.tableView.peopleList = personArray
        searchPersonArray = personArray
        apiForSearchPersonByNameCalled = true
    }
    
    override func getPersonDetails(_ url: String) {
        let lukeDetail = JsonKit().getPersonDetails()
        detailView?.person = lukeDetail
        apiForPersonDetailCalled = true
    }
}
