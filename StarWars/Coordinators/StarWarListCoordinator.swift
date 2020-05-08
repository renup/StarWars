//
//  StarWarListCoordinator.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import UIKit

class StarWarListCoordintor: Coordinator {
    var returnViewController: UIViewController?
    var starWarsListVC: StarWarsListViewController?
    var navigationController: UINavigationController?
    let viewModel: StarWarListViewModel
    var detailView: StarWarsDetailViewController?
    
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
            self?.getPeopleList()
        }
        
        starWarsListVC?.filterContent = {[weak self] searchName in
            self?.getPerson(by: searchName)
        }
        
        beginFlow()
    }
    
    func beginFlow() {
       getPeopleList()
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
    
    func getPeopleList() {
        viewModel.getPeopleList() {[weak self] (result) in
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
    
    func getPersonDetails(_ url: String) {
      
        viewModel.getPersonDetails(url: url) {[weak self] (result) in
           guard let self = self else { return }
           switch result {
           case .success(let people):
            self.detailView?.person = people
            guard let detailView = self.detailView else { return }
            self.navigationController?.pushViewController(detailView, animated: true)
           case .failure(let error):
               if self.viewModel.shouldShowError(error: error) {
                   self.detailView?.showAPIError(error)
               }
           }
        }
    }
    
    func beginDetailFlow(_ person: People) {
        detailView = StarWarsDetailViewController()
        getPersonDetails(person.url)
        
    }
}

//For testing reasons

extension StarWarListCoordintor {
    
    func triggerDidSelectPerson() {
        let people = People(name: "Luke Skywalker", gender: "male", url: "http://swapi.dev/api/people/1/", height: "172", mass: "77", hair_color: "blond", films: ["film"], species: ["species"], vehicles: ["vehicles"], starships: ["starships"])
        starWarsListVC?.tableView.didSelectStarWar(people)
    }
    
    func triggerFilterContent() {
        starWarsListVC?.filterContent("Luke")
    }
    
    func triggerRefreshList() {
        starWarsListVC?.refreshList()
    }
}

