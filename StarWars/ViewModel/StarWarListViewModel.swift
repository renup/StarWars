//
//  StarWarListViewModel.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation

final class StarWarListViewModel: APIRouter {
    
    func getPeopleList(_ completion: @escaping (Result<[People], APIServiceError>) -> Void) {
        performRequest(of: PeopleResponse.self, with: StarWarListEndPoint.peopleList) { (result) in
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
