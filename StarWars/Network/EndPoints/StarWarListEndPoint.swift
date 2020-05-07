//
//  StarWarListEndPoint.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation

enum StarWarListEndPoint: APIConfiguration {
    
    case peopleList
    case searchPerson(_ name: String)
    
    struct Constants {
        static let baseURL = "https://swapi.dev/api/"
        static let people = "people"
    }
    
    var method: String {
        switch self {
        case .peopleList, .searchPerson: return "GET"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .peopleList:
            return []
        case .searchPerson(let name):
            let nameQuery = URLQueryItem(name: "search", value: name)
            return [nameQuery]
        }
    }
    
    var path: String {
        switch self {
        case .peopleList, .searchPerson: return Constants.baseURL + Constants.people
        }
    }
    
    
}
