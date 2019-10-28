//
//  APIService.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

protocol APIService {
    func fetchRepositories(_ value: String, completion: @escaping (Result<[RepoData], Error>) -> ())
}

class APIServiceImpl: APIService {
    
    struct FetchRepositoriesResponse: Decodable {
        var items: [RepoData]
    }
    
    private var _provider: APIProvider
    
    private var _baseUrl: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("should init successfully")
        }
        
        return url
    }
    
    init(_ provider: APIProvider = APIProvider()) {
        _provider = provider
    }
    
    func fetchRepositories(_ value: String, completion: @escaping (Result<[RepoData], Error>) -> ()) {
        
        // TODO: The request mays be improved by doing an enum as Moya does
        return _provider
            .request(
                URLRequest(url: _baseUrl
                    .appendingPathComponent("/search/repositories")
                    .appendingQuery("q=" + value))
            ) { result in
                switch result {
                case .success(let data):
                    do {
                        let response = try JSONDecoder().decode(FetchRepositoriesResponse.self, from: data)
                        completion(.success(response.items))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

// Mock API
// completion([RepoData(name: "GithubAPI", owner: OwnerData(username: "jbdtky", avatarUrl: nil))])
