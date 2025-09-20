//
//  EditGameView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct EditGameView: View {
    @Binding var game: Game
    @Environment(\.dismiss) var dismiss
    @State private var draftGame: Game
    
    let statuses = ["Completed", "Wishlist", "In Progress"]
    
    init(game: Binding<Game>) {
        self._game = game
        self._draftGame = State(initialValue: game.wrappedValue)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("GAME DETAILS") {
                    TextField("Title", text: $draftGame.title)
                    TextField("Author", text: $draftGame.author)
                    
                    Picker("Status", selection: $draftGame.status) {
                        ForEach(statuses, id: \.self) { status in
                            Text(status)
                        }
                    }
                    
                    TextField("Description", text: $draftGame.description)
                }
                
                Section("MY RATING & REVIEW") {
                    StarRatingView(rating: $draftGame.rating)
                    
                    TextEditor(text: $draftGame.review)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Edit Game")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        game = draftGame
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
