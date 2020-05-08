//
//  JsonKit.swift
//  StarWarsTests
//
//  Created by Renu Punjabi on 5/7/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation

@testable import StarWars

final class JsonKit {
        
    func loadJson<T: Decodable>(of: T.Type, _ fileName: String = "people") -> T? {
       if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
           do {
               let data = try Data(contentsOf: url)
               let decoder = JSONDecoder()
               let jsonData = try decoder.decode(T.self, from: data)
               return jsonData
           } catch {
               print("error:\(error)")}
           }
       return nil
    }
    
    func searchPerson(_ fileName: String = "LukeSearchResult") -> [People] {
        let searchPerson = loadJson(of: PeopleResponse.self, fileName)!
        return searchPerson.results
    }
    
    func getPersonDetails(_ url: String = "http://swapi.dev/api/people/1/") -> People {
        let person = loadJson(of: People.self, "LukeDetail")
        return person!
    }
    
}
