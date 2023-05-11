//
//  FMGSeasonViewModel.swift
//  FootbalMatchGenerator
//
//  Created by Steven Wijaya on 11.05.2023.
//

import Foundation

final class FMGSeasonViewModel: ObservableObject {
    @Published var teams: [FCTeam] = [
        FCTeam(id: 0, name: "ИПМКН"),
        FCTeam(id: 1, name: "БИ"),
        FCTeam(id: 2, name: "ИИК"),
        FCTeam(id: 3, name: "ИЭМ"),
        FCTeam(id: 4, name: "HITs"),
        FCTeam(id: 5, name: "ГГФ"),
        FCTeam(id: 6, name: "ММФ"),
        FCTeam(id: 7, name: "РФФ"),
        FCTeam(id: 8, name: "ФЖ"),
        FCTeam(id: 9, name: "ФИЯ"),
        FCTeam(id: 10, name: "ФИТ"),
        FCTeam(id: 11, name: "ФИПН"),
        FCTeam(id: 12, name: "ФП"),
        FCTeam(id: 13, name: "ФФК"),
        FCTeam(id: 14, name: "ФТФ"),
        FCTeam(id: 15, name: "ФФ"),
        FCTeam(id: 16, name: "ФилФ"),
        FCTeam(id: 17, name: "ФсФ"),
        FCTeam(id: 18, name: "ХФ")
    ]
    
    @Published var matches: [Match] = [Match]()
    
    var n: Int
    
    init(_ n: Int) {
        self.n = n
    }
    
    func startSeason() {
        for _ in 1...n {
            for i in 0..<teams.count {
                for j in 0..<teams.count {
                    if i == j { continue } else {
                        var homeTeam: FCTeam = teams[i]
                        var awayTeam: FCTeam = teams[j]
                        
                        homeTeam.matchPlayed += 1
                        awayTeam.matchPlayed += 1
                        
                        var homeTeamGoals: Int = 0
                        var awayTeamGoals: Int = 0
                        
                        var alpha: Double = Double.random(in: 0.00...1.00)
                        
                        var s: Double = 0.0
                        var t: Double = 0.0
                        
                        s += log(alpha)
                        t += log(alpha)
                        print("S: \(s)")
                        print("t: \(t)")
                        while s > -lambda {
                            homeTeamGoals += 1
                            alpha = Double.random(in: 0.00...1.00)
                            s += log(alpha)
                        }
                        
                        while t > -lambda {
                            awayTeamGoals += 1
                            alpha = Double.random(in: 0.00...1.00)
                            t += log(alpha)
                        }
                        print(homeTeamGoals)
                        
                        if homeTeamGoals == awayTeamGoals {
                            homeTeam.goals += homeTeamGoals
                            awayTeam.goals += awayTeamGoals
                            
                            homeTeam.matchTied += 1
                            awayTeam.matchTied += 1
                            
                            homeTeam.score += 1
                            awayTeam.score += 1
                        } else if homeTeamGoals > awayTeamGoals {
                            homeTeam.goals += homeTeamGoals
                            awayTeam.goals += awayTeamGoals
                            
                            homeTeam.matchWon += 1
                            awayTeam.matchLost += 1
                            
                            homeTeam.score += 2
                            awayTeam.score -= 1
                        } else if homeTeamGoals < awayTeamGoals {
                            homeTeam.goals += homeTeamGoals
                            awayTeam.goals += awayTeamGoals
                            
                            homeTeam.matchLost += 1
                            awayTeam.matchWon += 1
                            
                            homeTeam.score -= 1
                            awayTeam.score += 2
                        }
                        
                        let thisMatch: Match = Match(homeTeam: homeTeam, awayTeam: awayTeam, homeTeamGoals: homeTeamGoals, awayTeamGoals: awayTeamGoals)
                        matches.append(thisMatch)
                        
                        teams[i] = homeTeam
                        teams[j] = awayTeam
                    }
                }
//                teams[i].calculateAvgGoals()
            }
        }
        
        sortScoreboard()
    }
    
    private func sortScoreboard() {
        teams.sort {
            $0.score > $1.score
        }
    }
}
