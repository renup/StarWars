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
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = tableView
        
    }


}

