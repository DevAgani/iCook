//
//  MealDBNetworkServiceTest.swift
//  LetsCookTests
//
//  Created by George Nyakundi on 17/02/2021.
//

import XCTest

@testable import LetsCook

class MealDBNetworkServiceTest: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    
    func test_Chefs_favorite_success() {
        let exp = expectation(description: "Fetch Chefs Favorite")
        let mealService = MealDBNetworkService()
        
        mealService.fetchChefsFavorite(fromURLString: "https://www.themealdb.com/api/json/v1/1/random.php") { (result) in
            switch result {
            case .success(let meals):
                print("Favorite meal is \(meals.meals)")
                exp.fulfill()
            case .failure(let error):
                XCTFail("Failed to Fetch Chef's Favorite \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }


    

}
