//
//  GameListView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct GameListView: View {
    
    @Binding var games: [Game]
    @State var showAddView: Bool = false
    @State var newGame = Game(
        title: "Test Game",
        image: "default_game",
        description: "This is a placeholder test entry for development purposes.",
        author: "Test Author",
        year: 2025,
        category: "In progress",
        rating: 3,
        review: "Just a test entry to check rendering and functionality.",
        status: "In Progress",
        isFavorite: false
    )
    
    var body: some View {
        NavigationStack {
            List($games, id: \.self.id) { $game in
                NavigationLink(destination: GameDetailView(game: $game)) {
                    GameListItemView(game: game)
                }
            }
            .navigationBarTitle("My Games")
            .navigationBarItems(trailing: Button("Add", action: {
                showAddView.toggle()
            }))
            .sheet(
                isPresented: $showAddView,
                onDismiss: {
                    let _ = print("This is dismissed")
                },
                content: {
                    EditGameView(game: $newGame)
                }
            )
        }
    }
}
