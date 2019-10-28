//
//  DelayThrottler.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © https://www.craftappco.com/blog/2018/5/30/simple-throttling-in-swift
//

import Foundation

//
// Class pick from this https://www.craftappco.com/blog/2018/5/30/simple-throttling-in-swift
// Already enough for debouncing the UI without RxSwift
// It may be improved
//
class Debounce {

    private var workItem: DispatchWorkItem = DispatchWorkItem(block: {})
    private var previousRun: Date = Date.distantPast
    private let queue: DispatchQueue
    private let minimumDelay: TimeInterval

    init(minimumDelay: TimeInterval, queue: DispatchQueue = DispatchQueue.main) {
        #if DEBUG
        print("init Debounce")
        #endif
        
        self.minimumDelay = minimumDelay
        self.queue = queue
    }
    
    deinit {
        #if DEBUG
        print("deinit Debounce")
        #endif
    }

    func debounce(_ block: @escaping () -> Void) {
        workItem.cancel()

        workItem = DispatchWorkItem() {
            [weak self] in
            self?.previousRun = Date()
            block()
        }

        let delay = previousRun.timeIntervalSinceNow > minimumDelay ? 0 : minimumDelay
        queue.asyncAfter(deadline: .now() + Double(delay), execute: workItem)
    }
}
