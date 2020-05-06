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
    
    struct Constants {
        static let baseURL = "https://swapi.dev/api/"
        static let people = "people"
    }
    
    var method: String {
        switch self {
        case .peopleList: return "GET"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .peopleList:
            return []
//            let peopleQuery = URLQueryItem(name: "people", value: "people")
//            return [peopleQuery]
        }
    }
    
    var path: String {
        switch self {
        case .peopleList: return Constants.baseURL + Constants.people
        }
    }
    
    
}
