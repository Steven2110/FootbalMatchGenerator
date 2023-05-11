//
//  FMGTeamView.swift
//  FootbalMatchGenerator
//
//  Created by Steven Wijaya on 11.05.2023.
//

import SwiftUI

struct FMGTeamView: View {
    
    var team: FCTeam
    var matches: [Match]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    VStack {
                        Text("Total matches").bold()
                        Text("\(team.matchPlayed)")
                    }
                    Spacer()
                    VStack {
                        Text("Score").bold()
                        Text("\(team.score)")
                    }
                }
                HStack(spacing: 50) {
                    VStack {
                        Text("Match won")
                            .bold()
                            .foregroundColor(.green)
                        Text("\(team.matchWon)")
                    }
                    VStack {
                        Text("Match lost")
                            .bold()
                            .foregroundColor(.red)
                        Text("\(team.matchLost)")
                    }
                    VStack {
                        Text("Match Tied")
                            .bold()
                            .foregroundColor(.gray)
                        Text("\(team.matchTied)")
                    }
                }
                HStack(spacing: 50) {
                    VStack {
                        Text("Goals")
                            .bold()
                        Text("\(team.goals)")
                    }
                    VStack {
                        Text("Average goals (/match)")
                            .bold()
                        Text("\(team.avgGoals, specifier: "%.1f")")
                    }
                }
            }.padding()
            Spacer()
            NavigationView {
                FMGMatchesListView(matches: matches)
            }
        }
        .navigationTitle(team.name)
    }
}

struct FMGTeamView_Previews: PreviewProvider {
    static var previews: some View {
        FMGTeamView(team: FCTeam(id: 1, name: "A"), matches: [Match(homeTeam: FCTeam(id: 1, name: "A"), awayTeam: FCTeam(id: 2, name: "B"), homeTeamGoals: 2, awayTeamGoals: 1)])
    }
}
