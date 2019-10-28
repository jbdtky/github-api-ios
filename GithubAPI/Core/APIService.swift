//
//  APIService.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

protocol APIService {
    func fetchRepositories(_ value: String, completion: @escaping ([RepoData]) -> ())
}

class APIServiceImpl: APIService {
    func fetchRepositories(_ value: String, completion: @escaping ([RepoData]) -> ()) {
        completion([RepoData(name: "GithubAPI", owner: OwnerData(username: "jbdtky", avatarUrl: nil))])
    }
}
