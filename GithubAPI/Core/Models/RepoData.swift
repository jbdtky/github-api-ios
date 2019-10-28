//
//  RepoData.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import Foundation

struct RepoData: Codable {
    var name: String
    var owner: OwnerData
}
