//
//  StarWarListViewModel.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation

final class StarWarListViewModel: APIRouter {
    
    func searchPerson(by name: String?, _ completion: @escaping (Result<[People], APIServiceError>) -> Void) {
        guard let name = name, !name.isEmpty else { return }
        
        performRequest(of: PeopleResponse.self, with: StarWarListEndPoint.searchPerson(name), url: nil) { (result) in
            switch result {
            case .success(let response):
                let peopleList = response.results
                completion(.success(peopleList))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    func getPeopleList(url: String?, _ completion: @escaping (Result<[People], APIServiceError>) -> Void) {
        performRequest(of: PeopleResponse.self, with: StarWarListEndPoint.peopleList, url: url) { (result) in
            switch result {
            case .success(let response):
                let peopleList = response.results
                completion(.success(peopleList))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    func shouldShowError(error: APIServiceError) -> Bool {
           guard error == .apiError else {  print(error.description); return false }
           return true
    }
}
