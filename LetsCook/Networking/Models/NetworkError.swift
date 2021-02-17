//
//  NetworkError.swift
//  LetsCook
//
//  Created by George Nyakundi on 17/02/2021.
//

import Foundation

public enum NetworkServiceError: Error {
    case invalidRequest(String)
    case invalidURL(String)
    case forwarded(Error)
    case invalidPayload(URL)
}
