//
//  APIService.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

protocol APIService {
    var baseUrl: URL { get }
    func fetchRepositories(_ value: String, completion: @escaping (Result<[RepoData], Error>) -> ())
}

class APIServiceImpl: APIService {
    
    var provider = APIProvider()
    
    var baseUrl: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("should init successfully")
        }
        
        return url
    }
    
    struct FetchRepositoriesResponse: Decodable {
        var items: [RepoData]
    }
    
    func fetchRepositories(_ value: String, completion: @escaping (Result<[RepoData], Error>) -> ()) {
        
        // TODO: The request mays be improved by doing an enum as Moya does
        return provider
            .request(
                URLRequest(url: baseUrl
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
