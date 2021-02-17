//
//  MealDBNetworkService.swift
//  LetsCook
//
//  Created by George Nyakundi on 17/02/2021.
//

import Foundation

//TODO: Extract Functionality to a more reusable Segment.
// Switch TO local JSON File Instead of Querying MealDB Due to Network Issue

final class MealDBNetworkService: NetworkingProtocol {
    func fetchChefsFavorite(fromURLString urlString: String, completionHandler: @escaping (Result<Meals, NetworkServiceError>) -> Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
//        let endpoint = Constants.shared.BaseURL + URLS.CHEFS_FAVORITE
        let endpoint = "https://www.themealdb.com/api/json/v1/1/random.php"

        
        guard let endpointURL = URL(string: endpoint) else {
            completionHandler(.failure(.invalidURL(endpoint)))
            return
        }
        
        let dataTask = session.dataTask(with: endpointURL) { (data, response, error) in
            guard error == nil else {
                completionHandler(.failure(NetworkServiceError.forwarded(error!)))
                return
            }
            
            guard let jsonData = data else {
                completionHandler(.failure(.invalidPayload(endpointURL)))
                return
            }
            
            self.decode(jsonData: jsonData, completionHandler: completionHandler)
        }
        dataTask.resume()
    }
    
    //TODO: Use Generics
    private func decode(jsonData: Data, completionHandler: @escaping (Result<Meals, NetworkServiceError>) -> Void) {
        let decoder = JSONDecoder()
        
        do  {            
            let meals = try decoder.decode(Meals.self, from: jsonData)
            completionHandler(.success(meals))
            
        } catch let error {
            completionHandler(.failure(.forwarded(error)))
        }
    }
    
    
}
