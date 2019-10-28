//
//  SearchViewController.swift
//  GithubAPI
//
//  Created by Jean-Baptiste Dominguez on 2019/10/28.
//  Copyright © 2019 Jean-Baptiste Dominguez. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    var presenter: SearchPresenter?
    
    private let cellId: String = "cellId"
    private var items: [RepoData]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    deinit {
        #if DEBUG
        print("deinit SearchViewController")
        #endif
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    private func setupUI() {
        title = "Github Repository"
        
        // Setup UI Search
        let searchVC = UISearchController()
        searchVC.searchBar.placeholder = "Search repository"
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
        
        // Setup UI Table
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if let item = items?[indexPath.row] {
            cell.textLabel?.text = item.name + " owned by " + item.owner.username
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let value = searchController.searchBar.text {
            presenter?.updateSearchResults(value)
        }
    }
}

extension SearchViewController: SearchViewControllerDelegate {
    func showSearchResults(_ results: [RepoData]) {
        items = results
    }
}