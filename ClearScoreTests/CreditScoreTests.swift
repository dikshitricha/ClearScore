//
//  CreditScoreTests.swift
//  ClearScoreTests
//
//  Created by Vinsier on 01/03/2018.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import XCTest
@testable import ClearScore

class CreditScoreTests: XCTestCase {
    var dashboardViewController: DashboardViewController?

    override func setUp() {
        super.setUp()
        
        self.dashboardViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
    }
    
    func testJSONMapping() throws {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "CreditScore", withExtension: "json") else {
            XCTFail("Missing file: CreditScore.json")
            return
        }
        
        let json = try Data(contentsOf: url)
        do {
            let creditScore = try JSONDecoder().decode(CreditScore.self, from: json)
            guard let creditReportInfo = creditScore.creditReportInfo else {
                XCTFail("creditReportInfo not found")
                return
            }
            guard let coachingSummary = creditScore.coachingSummary else {
                XCTFail("coachingSummary not found")
                return
            }
            XCTAssertEqual(creditScore.dashboardStatus, "PASS")
            XCTAssertEqual(creditScore.accountIDVStatus, "PASS")
            XCTAssertEqual(creditReportInfo.score, 514)
            XCTAssertEqual(creditReportInfo.maxScoreValue, 700)
            XCTAssertEqual(coachingSummary.numberOfTodoItems, 0)
            XCTAssertEqual(coachingSummary.activeChat, true)
            
        } catch {
             XCTFail("response should be of type CreditScore")
        }
      
        
    }    
}
