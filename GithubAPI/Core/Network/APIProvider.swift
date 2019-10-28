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
    
    private let _throttler: APIThrottler
    
    init(maximumSimultaneously: Int? = nil, queue: DispatchQueue? = nil) {
        _throttler = APIThrottler(maximumSimultaneously: maximumSimultaneously, queue: queue)
    }
    
    init(_ throttler: APIThrottler) {
        _throttler = throttler
    }
    
    // Request
    func request(_ urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> ()) {
        let request = APIRequest(urlRequest, completion: completion)
        _throttler.enqueue(request)
    }
}
