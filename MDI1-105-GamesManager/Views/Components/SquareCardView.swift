//
//  SquareCardView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct SquareCardView: View {
    @Binding var game: Game
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background image
            Image(game.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
            
            // Gradient overlay for readability
            LinearGradient(
                gradient: Gradient(colors: [.black.opacity(0.7), .clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(game.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text(game.author)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(1)
                
                HStack {
                    Text("\(game.year.description)")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Spacer()
                    
                    // Rating stars
                    HStack(spacing: 2) {
                        ForEach(0..<5) { i in
                            Image(systemName: i < game.rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.caption2)
                        }
                    }
                }
            }
            .padding(8)
        }
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(2)
    }
}
