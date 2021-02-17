//
//  NetworkingController.swift
//  LetsCook
//
//  Created by George Nyakundi on 17/02/2021.
//

import Foundation

public protocol NetworkingProtocol {
    func fetchChefsFavorite(fromURLString urlString: String, completionHandler: @escaping(Result<Meals,NetworkServiceError>) -> Void)
}
