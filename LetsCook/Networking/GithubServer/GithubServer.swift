//
//  GithubServer.swift
//  LetsCook
//
//  Created by George Nyakundi on 17/02/2021.
//

import Foundation

public class GithubServer: NetworkingProtocol {
    public func fetchChefsFavorite(fromURLString urlString: String, completionHandler: @escaping (Result<Meals, NetworkServiceError>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) {(data, response, error) in
                if let error = error {
                    completionHandler(.failure(NetworkServiceError.forwarded(error)))
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    
                    do  {
                        let meals = try decoder.decode(Meals.self, from: data)
                        completionHandler(.success(meals))
                    } catch let error {
                        completionHandler(.failure(.forwarded(error)))
                    }
                }
            }
            urlSession.resume()
        }
    }
}
