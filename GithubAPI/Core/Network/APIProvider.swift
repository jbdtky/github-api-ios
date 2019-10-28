//
//  APIProvider.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

class APIProvider {
    
    static func request(_ url: URL) -> Request {
        return Request(url)
    }
}
