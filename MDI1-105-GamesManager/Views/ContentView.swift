//
//  ContentView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var games = getGames()
    
    var body: some View {
        TabView {
            GameListView(games: $games)
            .tabItem {
                Label("Games", systemImage: "books.vertical.fill")
            }
            FavoritesView(games: $games)
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
