//
//  Match.swift
//  FootbalMatchGenerator
//
//  Created by Steven Wijaya on 11.05.2023.
//

import Foundation

struct Match: Identifiable {
    let id: UUID = UUID()
    let homeTeam: FCTeam
    let awayTeam: FCTeam
    let homeTeamGoals: Int
    let awayTeamGoals: Int
    var result: String {
        if homeTeamGoals == awayTeamGoals {
            return "Tie"
        } else if homeTeamGoals > awayTeamGoals {
            return "Win"
        } else if homeTeamGoals < awayTeamGoals {
            return "Lose"
        } else {
            return ""
        }
    }
    var awayResult: String {
        if homeTeamGoals == awayTeamGoals {
            return "Tie"
        } else if homeTeamGoals > awayTeamGoals {
            return "Lose"
        } else if homeTeamGoals < awayTeamGoals {
            return "Win"
        } else {
            return ""
        }
    }
}
