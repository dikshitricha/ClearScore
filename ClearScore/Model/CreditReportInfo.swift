//
//  CreditReportInfo.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import Foundation

class CreditReportInfo: Decodable {
    var score: Int?
    var scoreBand: Int?
    var clientRef: String?
    var status: String?
    var maxScoreValue: Int?
    var minScoreValue: Int?
    var monthsSinceLastDefaulted: Int?
    var hasEverDefaulted: Bool?
    var monthsSinceLastDelinquent: Int?
    var hasEverBeenDelinquent: Bool?
    var percentageCreditUsed: Int?
    var percentageCreditUsedDirectionFlag: Int?
    var changedScore: Int?
    var currentShortTermDebt: Int?
    var currentShortTermNonPromotionalDebt: Int?
    var currentShortTermCreditLimit: Int?
    var currentShortTermCreditUtilisation: Int?
    var changeInShortTermDebt: Int?
    var currentLongTermDebt: Int?
    var currentLongTermNonPromotionalDebt: Int?
    var currentLongTermCreditLimit: Int?
    var currentLongTermCreditUtilisation: Int?
    var changeInLongTermDebt: Int?
    var numPositiveScoreFactors: Int?
    var numNegativeScoreFactors: Int?
    var equifaxScoreBand: Int?
    var equifaxScoreBandDescription: String?
    var daysUntilNextReport: Int?
}
