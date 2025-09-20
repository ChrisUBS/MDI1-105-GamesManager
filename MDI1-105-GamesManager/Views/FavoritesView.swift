//
//  FavoritesView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var games: [Game]
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    // Computed Property
    private var favoriteGames: [Binding<Game>] {
        $games.filter { $0.wrappedValue.isFavorite }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach(favoriteGames, id: \.self.id) { game in
                        NavigationLink(destination: GameDetailView(game: game)) {
                            SquareCardView(game: game)
                        }
                    }
                }
            }
            .navigationBarTitle("My Favorite Games")
        }
    }
}
