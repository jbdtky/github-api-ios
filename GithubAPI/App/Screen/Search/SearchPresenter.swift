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
    func showError(_ title: String, message: String)
}

class SearchPresenter {
    
    weak var viewDelegate: SearchViewControllerDelegate?
    private let _service: APIService
    
    init(_ service: APIService = APIServiceImpl()) {
        #if DEBUG
        print("init SearchPresenter")
        #endif
        
        _service = service
    }
    
    deinit {
        #if DEBUG
        print("deinit SearchPresenter")
        #endif
    }
    
    func updateSearchResults(_ value: String) {
        _service
            .fetchRepositories(value) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let repositories):
                        self?.viewDelegate?.showSearchResults(repositories)
                    case .failure(let error):
                        self?.viewDelegate?.showError("Error fetching the repositories", message: error.localizedDescription)
                    }
                }
            }
    }
}
