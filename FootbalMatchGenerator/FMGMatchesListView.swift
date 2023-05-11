//
//  FMGMatchesListView.swift
//  FootbalMatchGenerator
//
//  Created by Steven Wijaya on 11.05.2023.
//

import SwiftUI

struct FMGMatchesListView: View {
    
    var matches: [Match]
    
    var body: some View {
        if matches.isEmpty {
            Text("No matches")
                .font(.largeTitle)
                .foregroundColor(.gray)
        } else {
            List {
                ForEach(matches) { match in
                    HStack {
                        VStack {
                            if match.result == "Win" {
                                Text(match.homeTeam.name)
                                    .foregroundColor(.green)
                                    .bold()
                            } else if match.result == "Lose" {
                                Text(match.homeTeam.name)
                                    .foregroundColor(.red)
                                    .fontWeight(.semibold)
                            } else {
                                Text(match.homeTeam.name)
                            }
                            Text("\(match.homeTeamGoals)")
                                .fontWeight(match.homeTeamGoals > match.awayTeamGoals ? .bold : .regular)
                        }.font(.title)
                        Text(":")
                            .font(.largeTitle)
                        VStack {
                            if match.result == "Win" {
                                Text(match.awayTeam.name)
                                    .foregroundColor(.red)
                                    .fontWeight(.semibold)
                            } else if match.result == "Lose" {
                                Text(match.awayTeam.name)
                                    .foregroundColor(.green)
                                    .bold()
                            } else {
                                Text(match.awayTeam.name)
                            }
                            Text("\(match.awayTeamGoals)")
                                .fontWeight(match.awayTeamGoals > match.homeTeamGoals ? .bold : .regular)
                        }.font(.title)
                        Spacer()
                        VStack {
                            Text("Home team:").font(.subheadline)
                            Text(match.result)
                                .font(.title)
                                .bold()
                                .foregroundColor(match.result == "Win" ? .green : match.result == "Lose" ? .red : .gray)
                        }
                    }
                }
            }
            .navigationTitle("Matches")
        }
    }
}

struct FMGTeamListView_Previews: PreviewProvider {
    static var previews: some View {
        FMGMatchesListView(matches: [Match(homeTeam: FCTeam(id: 1, name: "A"), awayTeam: FCTeam(id: 2, name: "B"), homeTeamGoals: 2, awayTeamGoals: 1)])
    }
}
