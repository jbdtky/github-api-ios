//
//  APIProvider.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

// Singleton
class APIProvider {
    
    private let throttler: APIThrottler
    
    init(maximumSimultaneously: Int? = nil, queue: DispatchQueue? = nil) {
        throttler = APIThrottler(maximumSimultaneously: maximumSimultaneously, queue: queue)
    }
    
    // Request
    func request(_ urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> ()) {
        let request = APIRequest(urlRequest, completion: completion)
        throttler.enqueue(request)
    }
}
