//
//  GameDetailView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct GameDetailView: View {
    @Binding var game: Game
    @State private var showingEdit = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                HStack(alignment: .top, spacing: 16) {
                    Image(game.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(game.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("by \(game.author)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(game.description)
                            .font(.body)
                            .padding(.top, 4)
                    }
                    Spacer()
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("My Review")
                        .font(.headline)
                    
                    HStack(spacing: 2) {
                        ForEach(1...5, id: \.self) { i in
                            Image(systemName: i <= game.rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    Text(game.review)
                        .font(.body)
                        .padding(.top, 4)
                }
                HStack {
                    Spacer()
                    Toggle(isOn: $game.isFavorite) {
                        Image(systemName: game.isFavorite ? "heart.fill" : "heart")
                            .renderingMode(.original)
                    }
                    .toggleStyle(.button)
                    .font(.title)
                    .accessibilityLabel(game.isFavorite ? "Remove from favorites" : "Add to favorites")
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    showingEdit = true
                }
            }
        }
        .sheet(isPresented: $showingEdit) {
            EditGameView(game: $game)
        }
    }
}

