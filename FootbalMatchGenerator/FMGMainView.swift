//
//  FMGMainView.swift
//  FootbalMatchGenerator
//
//  Created by Steven Wijaya on 11.05.2023.
//

import SwiftUI

struct FMGMainView: View {
    
    @ObservedObject var vm: FMGSeasonViewModel = FMGSeasonViewModel(2)
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(vm.teams) { team in
                        NavigationLink {
                            FMGTeamView(team: team, matches: filterMatches(vm.matches, teamName: team.name))
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(team.name).font(.largeTitle)
                                    HStack(spacing: 0) {
                                        Text("\(team.matchWon)").foregroundColor(.green)
                                        Text("-")
                                        Text("\(team.matchLost)").foregroundColor(.red)
                                        Text("-")
                                        Text("\(team.matchTied)").foregroundColor(.gray)
                                    }.font(.title2)
                                }
                                Spacer()
                                Text("\(team.score)").font(.title)
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    Button {
                        vm.startSeason()
                    } label: {
                        startSeasonButton
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(Color.white.opacity(0.94))
                }
                
            }
            .navigationTitle("Scoreboard")
            .toolbar {
                NavigationLink {
                    FMGMatchesListView(matches: vm.matches)
                } label: {
                    Text("View Matches")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FMGMainView()
    }
}

extension FMGMainView {
    private func filterMatches(_ matches: [Match], teamName: String) -> [Match] {
        var filteredMatches: [Match] = matches.filter {
            $0.homeTeam.name == teamName || $0.awayTeam.name == teamName
        }
        return filteredMatches
    }
    
    private var startSeasonButton: some View {
        Text("Start Season")
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
