//
//  GithubAPIUITests.swift
//  GithubAPIUITests
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest

class GithubAPIUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasicFlow() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let githubRepositoryNavigationBar = XCUIApplication().navigationBars["Github Repository"]
        let searchRepositorySearchField = githubRepositoryNavigationBar.searchFields["Search repository"]
        searchRepositorySearchField.tap()
        searchRepositorySearchField.typeText("Test")
        githubRepositoryNavigationBar.buttons["Cancel"].tap()
        
        let expection = XCTestExpectation(description: "result")
        
        // The research should reach a result before 3s...
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            let tablesQuery = app.tables
            XCTAssertGreaterThan(tablesQuery.count, 0)
            
            expection.fulfill()
        }
        
        wait(for: [expection], timeout: 5)
    }
}
