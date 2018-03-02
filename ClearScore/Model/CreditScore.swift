//
//  CreditScore.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import Foundation

class CreditScore: Decodable {
    var accountIDVStatus: String?
    var dashboardStatus: String?
    var personaType: String?
    var augmentedCreditScore: String?
    var creditReportInfo: CreditReportInfo?
    var coachingSummary: CoachingSummary?
}
