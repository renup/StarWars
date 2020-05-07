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
    
    private var detailView: StarWarDetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guard let person = person else { return }
        detailView = StarWarDetailView(person)
        view = detailView
        title = person.name
    }
}
