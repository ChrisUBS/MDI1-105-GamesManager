//
//  Game.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import Foundation

struct Game: Identifiable {
    var id = UUID()
    var title: String = ""
    var image: String = "default_game"
    var description: String = ""
    var author: String = ""
    var year: Int? = nil
    var category: String = ""
    var rating: Int = 0
    var review: String = ""
    var status: String = "Wishlist"
    var isFavorite: Bool = false
}
