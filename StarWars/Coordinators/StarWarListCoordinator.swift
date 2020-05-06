//
//  StarWarListCoordinator.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import UIKit

final class StarWarListCoordintor: Coordinator {
    var returnViewController: UIViewController?
    var starWarsListVC: StarWarsListViewController?
    var navigationController: UINavigationController?
    let viewModel: StarWarListViewModel
    
    init(navigationController: UINavigationController?, returnViewController: UIViewController?) {
        self.navigationController = navigationController
        self.returnViewController = returnViewController
        viewModel = StarWarListViewModel()
    }
    
    func start() {
        guard let listVC = navigationController?.viewControllers.first as? StarWarsListViewController else {
            print("it should be starwarsListVC")
            return
        }
        starWarsListVC = listVC
        beginFlow()
    }
    
    func beginFlow() {
        
        viewModel.getPeopleList {[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let people):
                self.starWarsListVC?.tableView.peopleList = people
            case .failure(let error):
                if self.viewModel.shouldShowError(error: error) {
                    self.starWarsListVC?.showAPIError(error)
                }
            }
        }
        
    }
}
