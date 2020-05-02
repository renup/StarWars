//
//  Coordinator.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var returnViewController: UIViewController? { get set }
    var navigationController: UINavigationController? { get set }
}
