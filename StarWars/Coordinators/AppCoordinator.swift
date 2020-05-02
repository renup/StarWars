//
//  AppCoordinator.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    var navigationVC: UINavigationController?
    var starWarListCoordinator: StarWarListCoordintor?
    
    init(navigationVC: UINavigationController) {
        self.navigationVC = navigationVC
    }
    
    func start() {
        starWarListCoordinator = StarWarListCoordintor(navigationController: navigationVC, returnViewController: nil)
        starWarListCoordinator?.start()
    }
    
}
