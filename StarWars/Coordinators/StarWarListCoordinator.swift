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
    
    init(navigationController: UINavigationController?, returnViewController: UIViewController?) {
        self.navigationController = navigationController
        self.returnViewController = returnViewController
    }
    
    func start() {
        guard starWarsListVC == navigationController?.viewControllers.first as? StarWarsListViewController else { return }
        print("starList")
    }
}
