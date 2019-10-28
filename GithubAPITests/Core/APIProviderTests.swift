//
//  APIProviderTests.swift
//  GithubAPITests
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import XCTest
@testable import GithubAPI

class APIProviderTests: XCTestCase {
    
    func testRequest() {
        let throttler = APIThrottlerMock()
        let provider = APIProvider(throttler)
        let request = URLRequest(url: URL(fileURLWithPath: ""))
        
        provider.request(request) { _ in
            // Do nothing
        }
        
        XCTAssertTrue(throttler.hasEnqueue)
    }
}
