//
//  SearchViewControllerErrorMock.swift
//  GithubAPITests
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest
@testable import GithubAPI

class SearchViewControllerErrorMock: SearchViewControllerDelegate {
    
    var showErrorHasBeenCalledSuccessfully: Bool = false
    
    func showSearchResults(_ result: [RepoData]) {
        XCTFail()
    }
    
    func showError(_ title: String, message: String) {
        showErrorHasBeenCalledSuccessfully = true
    }
}
