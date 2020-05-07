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
    var results: [People]
}

struct People: Decodable {
    let name: String
    let gender: String
    let url: String
    let height: String
    let mass: String
    let hair_color: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
}
