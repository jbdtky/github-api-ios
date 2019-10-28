//
//  Request.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case emptyData
}

class Request {
    private let url: URL
    private var dataTask: URLSessionDataTask?
    
    init(_ url: URL) {
        self.url = url
    }
    
    func throttle(_ minimumDelay: TimeInterval) -> Request {
        // TODO: Implement here
        return self
    }
    
    func resume(_ completion: @escaping (Result<Data, Error>) -> ()) {
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let data = data else {
                    completion(.failure(RequestError.emptyData))
                    return
                }
                
                completion(.success(data))
            }
        })
        
        // TODO: Implement here
        // Execute with a throttle interval if it has been precised
        dataTask?.resume()
    }
}
