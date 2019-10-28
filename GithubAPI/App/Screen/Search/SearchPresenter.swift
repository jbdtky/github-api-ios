//
//  SearchPresenter.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

protocol SearchViewControllerDelegate: class {
    func showSearchResults(_ result: [RepoData])
}

class SearchPresenter {
    
    weak var viewDelegate: SearchViewControllerDelegate?
    private let service: APIService
    
    init(_ service: APIService = APIServiceImpl()) {
        #if DEBUG
        print("init SearchPresenter")
        #endif
        
        self.service = service
    }
    
    deinit {
        #if DEBUG
        print("deinit SearchPresenter")
        #endif
    }
    
    func updateSearchResults(_ value: String) {
        let results = service.fetchRepositories(value)
        viewDelegate?.showSearchResults(results)
    }
}
