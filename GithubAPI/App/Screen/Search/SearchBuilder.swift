//
//  SearchBuilder.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import UIKit

class SearchBuilder {
    
    static func provide() -> UIViewController {
        let vc = SearchViewController()
        
        let presenter = SearchPresenter()
        presenter.viewDelegate = vc
        
        vc.presenter = presenter
        return vc
    }
}
