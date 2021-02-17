//
//  Constants.swift
//  LetsCook
//
//  Created by George Nyakundi on 17/02/2021.
//

import Foundation

public class Constants {
    static let shared = Constants()
    
    let BaseURL = "https://www.themealdb.com/api/json/v1/1/"
}

public class URLS {
    static let CHEFS_FAVORITE = "random.php"
    static let GITHUB_CHEFS_FAVORITE_ENDPOINT = "https://raw.githubusercontent.com/DevAgani/iCookAppData/master/chefsFavorite.json"
}
