//
//  SearchViewControllerSuccessMock.swift
//  GithubAPITests
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest
@testable import GithubAPI

class SearchViewControllerSuccessMock: SearchViewControllerDelegate {
    
    var showResultsHasBeenCalledSuccessfully: Bool = false
    var result: [RepoData]?
    
    func showSearchResults(_ result: [RepoData]) {
        self.result = result
        showResultsHasBeenCalledSuccessfully = true
    }
    
    func showError(_ title: String, message: String) {
        XCTFail()
    }
}
