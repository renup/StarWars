//
//  StarWarsDetailViewController.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/6/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import UIKit

final class StarWarsDetailViewController: UIViewController {
    
    var person: People?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = person?.name
        view.backgroundColor = .white
    }
}
