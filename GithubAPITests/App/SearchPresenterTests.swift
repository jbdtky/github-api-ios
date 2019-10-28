//
//  SearchPresenterTests.swift
//  GithubAPITests
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest
@testable import GithubAPI

class SearchPresenterTests: XCTestCase {
    
    func testUpdateSearchResultsSuccess() {
        let searchViewControllerSuccessMock = SearchViewControllerSuccessMock()
        let presenter = SearchPresenter(APIServiceMock())
        presenter.viewDelegate = searchViewControllerSuccessMock

        let expectation = XCTestExpectation(description: "updateSearchResults")
        presenter.updateSearchResults("success")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertTrue(searchViewControllerSuccessMock.showResultsHasBeenCalledSuccessfully)
            
            XCTAssertEqual(searchViewControllerSuccessMock.result?.count, 1)
            XCTAssertEqual(searchViewControllerSuccessMock.result?.first?.name, "Repomocker")
            XCTAssertEqual(searchViewControllerSuccessMock.result?.first?.owner.username, "Mocker")
            XCTAssertEqual(searchViewControllerSuccessMock.result?.first?.owner.avatarUrl, "")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testUpdateSearchResultsError() {
        let searchViewControllerErrorMock = SearchViewControllerErrorMock()
        let presenter = SearchPresenter(APIServiceMock())
        presenter.viewDelegate = searchViewControllerErrorMock

        let expectation = XCTestExpectation(description: "updateSearchResults")
        presenter.updateSearchResults("error")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertTrue(searchViewControllerErrorMock.showErrorHasBeenCalledSuccessfully)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
}
