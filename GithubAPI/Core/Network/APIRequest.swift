//
//  APIRequest.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case emptyData
}

class APIRequest {
    
    private let _urlRequest: URLRequest
    let _completion: (Result<Data, Error>) -> ()
    
    init(_ urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> ()) {
        #if DEBUG
        print("init APIRequest")
        #endif
        
        self._urlRequest = urlRequest
        self._completion = completion
    }
    
    deinit {
        #if DEBUG
        print("deinit APIRequest")
        #endif
    }
    
    func resume() {
        URLSession.shared.dataTask(with: _urlRequest, completionHandler: { (data, response, error) in
            if let error = error {
                self._completion(.failure(error))
            } else {
                if let data = data {
                    self._completion(.success(data))
                } else {
                    self._completion(.failure(RequestError.emptyData))
                }
            }
        }).resume()
    }
}
