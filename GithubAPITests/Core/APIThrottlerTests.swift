//
//  APIThrottlerTests.swift
//  GithubAPITests
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest
@testable import GithubAPI

class APIThrottlerTests: XCTestCase {
    
    func testSerial() {
        let throttler = APIThrottler(maximumSimultaneously: 1)
        
        let group = DispatchGroup()
        let amountOfRequest = 5
        var shouldBeId = 0
        
        for i in 0...amountOfRequest {
            group.enter()
            
            let request = APIRequestMockWithDelay(UInt32(amountOfRequest - i), completion: { _ in
                // The request should be sequencial
                XCTAssertEqual(shouldBeId, i)
                shouldBeId += 1
                group.leave()
            })
            
            throttler.enqueue(request)
        }
        
        group.wait()
    }
}
