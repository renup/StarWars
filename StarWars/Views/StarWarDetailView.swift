//
//  StarWarDetailView.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/6/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import UIKit

final class StarWarDetailView: UIView {
    
    struct Layout {
        static let insets = UIEdgeInsets(top: 20, left: 20, bottom: 50, right: 20)
        static let spacing: CGFloat = 5
        static let height: CGFloat = 40
    }
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.height(constant: Layout.height)
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.height(constant: Layout.height)
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.height(constant: Layout.height)
        return label
    }()
    
    private lazy var hairColorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.height(constant: Layout.height)
        return label
    }()
    
    private lazy var filmsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.height(constant: Layout.height)
        return label
    }()
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.height(constant: Layout.height)
        return label
    }()
    
    private lazy var vehiclesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.height(constant: Layout.height)
        return label
    }()
    
    private lazy var starshipsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.height(constant: Layout.height)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [genderLabel, weightLabel, heightLabel, hairColorLabel, filmsLabel, speciesLabel, vehiclesLabel, starshipsLabel])
        stack.axis = .vertical
        stack.spacing = Layout.spacing
        return stack
    }()
    
    var person: People
    
    init(_ person: People) {
        self.person = person
        super.init(frame: .zero)
        backgroundColor = .white
        configureLayout()
        configureLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        wrapToSafeArea(stackView, exceptBottom: true, insets: Layout.insets)
    }
    
    func configureLabels() {
        genderLabel.text = "Gender: " + person.gender
        weightLabel.text = "Weight: " + person.mass
        heightLabel.text = "Height: " + person.height
        hairColorLabel.text = "Hair Color: " + person.hair_color
        filmsLabel.text = "Films: " + String(describing: person.films.count)
        speciesLabel.text = "Species: " + String(describing: person.species.count)
        vehiclesLabel.text = "Vehicles: " + String(describing: person.vehicles.count)
        starshipsLabel.text = "Starships: " + String(describing: person.starships.count)
    }
}
