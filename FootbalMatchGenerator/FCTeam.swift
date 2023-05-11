//
//  FCTeam.swift
//  FootbalMatchGenerator
//
//  Created by Steven Wijaya on 11.05.2023.
//

import Foundation

struct FCTeam: Identifiable {
    let id: Int
    let name: String
    var matchPlayed: Int = 0
    var matchWon: Int = 0
    var matchLost: Int = 0
    var matchTied: Int = 0
    var score: Int = 0
    var goals: Int = 0
    var avgGoals: Double {
        if matchPlayed == 0 {
            return 0.0
        } else {
            return round(Double(goals) / Double(matchPlayed) * 10) / 10.0
        }
    }
    
//    mutating func calculateAvgGoals() {
//        avgGoals = Double(goals) / Double(matchPlayed)
//    }
}
