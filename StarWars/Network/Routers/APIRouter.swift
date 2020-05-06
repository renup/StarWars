//
//  APIRouter.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/2/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation

public enum APIServiceError: Error {
    case decodeError
    case invalidResponse
    case invalidEndpoint
    case noData
    case apiError
    
    var description: String {
        switch self {
        case .decodeError: return  "Error during decoding response"
        case .invalidEndpoint: return  "Incorrect params or request URL"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data returned from the API call"
        case .apiError: return "API failed. Unable to fetch data at this time. Try again in few minutes"
        }
    }
}

protocol APIRouter {
    func performRequest<T: Decodable>(of: T.Type, with route: APIConfiguration, completion: @escaping (Result<T, APIServiceError>) -> Void)
}

extension APIRouter {
    func getURL(_ route: APIConfiguration) -> URL? {
        let path = route.path
        
        guard var urlComponents = URLComponents(string: path) else { return nil }
        
        urlComponents.queryItems = route.parameters
        return urlComponents.url
    }
    
    func performRequest<T: Decodable>(of: T.Type, with route: APIConfiguration, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        
        guard let url = getURL(route) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode  else {
                    DispatchQueue.main.async {
                        completion(.failure(.invalidResponse))
                    }
                    return
                }
                
                do {
                    let values = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(values))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(.decodeError))
                    }
                }
                
            case .failure(_):
                DispatchQueue.main.async {
                    completion(.failure(.apiError))
                }
            }
        }.resume()
    }
    
}
