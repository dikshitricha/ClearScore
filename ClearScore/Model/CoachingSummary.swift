//
//  CoachingSummary.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import Foundation

public class CoachingSummary: Decodable {
    var activeTodo: Bool?
    var activeChat: Bool?
    var numberOfTodoItems: Int?
    var numberOfCompletedTodoItems: Int?
    var selected: Bool?
}
