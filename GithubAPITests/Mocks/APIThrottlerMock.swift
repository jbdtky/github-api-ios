//
//  APIThrottlerMock.swift
//  GithubAPITests
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation
@testable import GithubAPI

class APIThrottlerMock: APIThrottler {
    
    var hasEnqueue = false
    
    override func enqueue(_ request: APIRequest) {
        hasEnqueue = true
    }
}
