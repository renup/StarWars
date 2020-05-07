//
//  StarWarsListViewController.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import UIKit

final class StarWarsListViewController: UIViewController {

    
    lazy var tableView: StarWarsListView = {
      let tableView = StarWarsListView()
        tableView.didSelectStarWar = { [weak self] person in
            self?.didSelectPerson(person)
        }
        
        tableView.searching = {[weak self] searchText in
            self?.filterContent(searchText)
        }
        
        tableView.refreshList = { [weak self] in
            self?.refreshList()
        }
        return tableView
        
    }()
    
    var didSelectPerson: (People) -> Void = { _ in }
    var filterContent: (String) -> Void = { _ in }
    var refreshList: () -> Void = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = tableView
        title = "Star Wars"
        navigationItem.searchController = tableView.searchController
        definesPresentationContext = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.searchController.dismiss(animated: false, completion: nil)
    }


}

