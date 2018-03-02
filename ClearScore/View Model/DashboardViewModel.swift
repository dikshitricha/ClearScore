//
//  DashboardViewModel.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import Foundation
import UIKit

struct  DashboardViewModel {
    var score: Int?
    var maxScore: Int?
    var userDidPass: Bool = false
    var scoreColor : UIColor {
        get {
            if userDidPass {
                return UIColor(red: 62/255, green: 154/255, blue: 205/255, alpha: 1.0)
            }
            return UIColor.orange
        }
    }
    
    init(creditScore: CreditScore) {
        self.score = creditScore.creditReportInfo?.score
        self.maxScore = creditScore.creditReportInfo?.maxScoreValue
        self.userDidPass = (creditScore.dashboardStatus == "PASS")
    }
}
