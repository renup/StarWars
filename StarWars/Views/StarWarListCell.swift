//
//  StarWarListCell.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/6/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import UIKit

final class StarWarListCell: UITableViewCell, ReusableView {
    
    struct Layout {
        static let boldFontSize: CGFloat = 15
        static let systemFontSize: CGFloat = 13
        static let spacing: CGFloat = 5
        static let insets: UIEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: Layout.boldFontSize)
        label.numberOfLines = 0
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: Layout.systemFontSize)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [nameLabel, genderLabel])
        stack.axis = .vertical
        stack.spacing = Layout.spacing
        return stack
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        wrap(view: stackView, insets: Layout.insets)
    }
    
    func configure(_ person: People) {
        nameLabel.text = person.name
        genderLabel.text = person.gender
    }
}
