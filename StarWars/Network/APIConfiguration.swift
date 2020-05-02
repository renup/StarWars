//
//  APIConfiguration.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation

protocol APIConfiguration {
    var method: String { get }
    var parameters: [URLQueryItem] { get }
    var path: String { get }
}
