//
//  APIServiceMock.swift
//  GithubAPITests
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation
@testable import GithubAPI

enum APIServiceMockError: Error {
    case error
}

class APIServiceMock: APIService {
    
    func fetchRepositories(_ value: String, completion: @escaping (Result<[RepoData], Error>) -> ()) {
        if value == "error" {
            completion(.failure(APIServiceMockError.error))
        } else {
            completion(.success([RepoData(name: "Repomocker", owner: OwnerData(username: "Mocker", avatarUrl: ""))]))
        }
    }
    
}
