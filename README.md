# GithubAPI
[![Build Status](https://travis-ci.com/jbdtky/github-api-ios.svg?branch=master)](https://travis-ci.com/jbdtky/github-api-ios)
[![codecov](https://codecov.io/gh/jbdtky/github-api-ios/branch/master/graph/badge.svg)](https://codecov.io/gh/jbdtky/github-api-ios)
![Platform](https://img.shields.io/badge/platform-ios-black.svg) 
![Compatibility](https://img.shields.io/badge/iOS-+13.0-orange.svg) 
![Compatibility](https://img.shields.io/badge/Swift-5.0-orange.svg) 
![License](https://img.shields.io/badge/License-MIT-lightgrey.svg) 

Search a repository using the Github API.

## Requirements
- Make a search screen that allows the user to search for repositories on Github ✅
- Do NOT use any third party libraries i.e RxSwit / Moya ✅
- Implement network throttling ✅

## Backlogs
- Setup Repo + CI ✅
- Setup UI + API base ✅
- Call github search API ✅
- Implement network throttling ✅
- Implement debounce on tap ✅
- Write some tests with some mocks ✅

## Challenges
- Moya & Alamofire and RxSwift are really powerful. It was really interesting to see how they operated and see what I could do. 
- I tried to make something simple, efficient and tested with 8 hours.
- Due to the position, I did not polish the UI but I did prefer work on the core feature and its robustness (no leaks).
- I setup a CI because it shows really quickly an idea about the seriousness of a development.

## Improvements
- A lot of features could be added and make something much more abstracted as Moya, RxSwift and Alamofire are doing. Futhermore a cache is welcome too.
- Use new Swift 5 features as Publisher and Subscriber, It may be really excited to work with, I did not experiment it yet.
