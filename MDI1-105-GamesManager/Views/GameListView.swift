//
//  GameListView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct GameListView: View {
    
    @Binding var games: [Game]
    @State var showEditView: Bool = false
    @State var newGame = Game()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($games, id: \.id) { $game in
                    NavigationLink(destination: GameDetailView(game: $game)) {
                        GameListItemView(game: game)
                    }
                }
                .onDelete(perform: deleteGames)
            }
            .navigationBarTitle("My Games")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button("Add", action: {
                    newGame = Game()
                    showEditView.toggle()
                })
            )
            .sheet(isPresented: $showEditView) {
                AddEditGameView(game: $newGame) { savedGame in
                    if !games.contains(where: { $0.id == savedGame.id }) {
                        games.append(savedGame)
                    }
                }
            }
        }
    }
    
    private func deleteGames(at offsets: IndexSet) {
        games.remove(atOffsets: offsets)
    }
}
