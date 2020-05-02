//
//  PeopleResponse.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation

struct PeopleResponse: Decodable {
    var next: String?
    var previous: String?
    var results: [People]?
}

struct People: Decodable {
    var name: String?
    var gender: String?
}
