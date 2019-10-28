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

    private var _workItem: DispatchWorkItem = DispatchWorkItem(block: {})
    private var _previousRun: Date = Date.distantPast
    private let _queue: DispatchQueue
    private let _minimumDelay: TimeInterval

    init(minimumDelay: TimeInterval, queue: DispatchQueue = DispatchQueue.main) {
        #if DEBUG
        print("init Debounce")
        #endif
        
        _minimumDelay = minimumDelay
        _queue = queue
    }
    
    deinit {
        #if DEBUG
        print("deinit Debounce")
        #endif
    }

    func debounce(_ block: @escaping () -> Void) {
        _workItem.cancel()

        _workItem = DispatchWorkItem() {
            [weak self] in
            self?._previousRun = Date()
            block()
        }

        let delay = _previousRun.timeIntervalSinceNow > _minimumDelay ? 0 : _minimumDelay
        _queue.asyncAfter(deadline: .now() + Double(delay), execute: _workItem)
    }
}
