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
        starWarsListVC?.didSelectPerson = {[weak self] person in
            self?.beginDetailFlow(person)
        }
        
        starWarsListVC?.refreshList = {[weak self] in
            self?.getPeopleList(nil)
        }
        
        starWarsListVC?.filterContent = {[weak self] searchName in
            self?.getPerson(by: searchName)
        }
        
        beginFlow()
    }
    
    func beginFlow() {
       getPeopleList(nil)
    }
    
    func getPerson(by name: String) {
        viewModel.searchPerson(by: name) {[weak self] (result) in
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
    
    func getPeopleList(_ url: String?) {
        viewModel.getPeopleList(url: url) {[weak self] (result) in
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
    
    func beginDetailFlow(_ person: People) {
        getPeopleList(person.url)
    }
}
