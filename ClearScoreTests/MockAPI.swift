//
//  MockAPI.swift
//  ClearScoreTests
//
//  Created by Vinsier on 01/03/2018.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import XCTest
@testable import ClearScore
class MockAPI: DataManager {
    override func fetchCreditScore(success: @escaping Success, failure: @escaping Failure) {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "CreditScore", withExtension: "json") else {
            failure(.inValidURL)
            return
        }
        
        let json = try? Data(contentsOf: url)
        do {
            let creditScore = try JSONDecoder().decode(CreditScore.self, from: json!)
            success(creditScore)
        } catch {
            failure(.networkError)
            return
        }
    }
}
