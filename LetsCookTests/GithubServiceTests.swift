//
//  GithubServiceTests.swift
//  LetsCookTests
//
//  Created by George Nyakundi on 17/02/2021.
//

import XCTest

@testable import LetsCook

class GithubServiceTests: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func test_fetchChefsFavorite_success() {
        let githubService = GithubServer()
        let exp = expectation(description: "Fetch Chefs Favorites from Github")
        
        githubService.fetchChefsFavorite(fromURLString: "https://www.themealdb.com/api/json/v1/1/random.php") { (result) in
            switch result {
            case .success(let meals):
                print(meals)
                exp.fulfill()
            case .failure(let error):
                XCTFail("Unable to Fetch Chef's Favorite from Github \(error.localizedDescription)")
            }
            
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }

}
