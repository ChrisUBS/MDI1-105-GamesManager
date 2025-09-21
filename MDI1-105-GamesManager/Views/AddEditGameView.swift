//
//  EditGameView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct AddEditGameView: View {
    @Binding var game: Game
    var onSave: (Game) -> Void
    @Environment(\.dismiss) var dismiss
    @State private var draftGame: Game
    @State private var navigationTitle: String

    
    let statuses = ["Completed", "Wishlist", "In Progress"]
    
    init(game: Binding<Game>, onSave: @escaping (Game) -> Void) {
        self._game = game
        self._draftGame = State(initialValue: game.wrappedValue)
        self._navigationTitle = State(initialValue: game.wrappedValue.title.isEmpty ? "Add a new game" : "Edit game")
        self.onSave = onSave
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
                    
                    TextField("Year", text: Binding(
                            get: { draftGame.year.map { String($0) } ?? "" },
                            set: { draftGame.year = Int($0) }
                        ))
                        .keyboardType(.numberPad)
                    
                    TextField("Description", text: $draftGame.description)
                }
                
                Section("MY RATING & REVIEW") {
                    StarRatingView(rating: $draftGame.rating)
                    
                    TextEditor(text: $draftGame.review)
                        .frame(height: 100)
                }
            }
            .navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        game = draftGame
                        onSave(draftGame)
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
