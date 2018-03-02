//
//  DashboardViewModelTests.swift
//  ClearScoreTests
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import XCTest
@testable import ClearScore

class DashboardViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        let dataManager = MockAPI()
        dataManager.fetchCreditScore(success: { response in
            if let creditScore = response as? CreditScore {
                let dashboardViewModel = DashboardViewModel(creditScore: creditScore)
                XCTAssertEqual(dashboardViewModel.maxScore, 700)
                XCTAssertEqual(dashboardViewModel.score, 514)
                XCTAssertEqual(dashboardViewModel.scoreColor, UIColor(red: 62/255, green: 154/255, blue: 205/255, alpha: 1.0))
            }
        }, failure: { error in
            XCTFail("Fake fetch should not fail with error: \(error ?? APIError.unknownError)")
        })
    }
    
}
