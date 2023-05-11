//
//  FMGTeamListView.swift
//  FootbalMatchGenerator
//
//  Created by Steven Wijaya on 11.05.2023.
//

import SwiftUI

struct FMGMatchesListView: View {
    
    var teams: [FCTeam]
    
    var body: some View {
        List {
            ForEach(teams) { team in
                NavigationLink {
                    FMGTeamView(team: team)
                } label: {
                    
                }
            }
        }
    }
}

struct FMGTeamListView_Previews: PreviewProvider {
    static var previews: some View {
        FMGMatchesListView(teams: [FCTeam(id: 1, name: "A")])
    }
}
