//
//  api.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import Foundation

func getGames() -> [Game] {
    return [ // Hardcoded
        Game(
            title: "Grand Theft Auto V",
            image: "gtav",
            description: "An open-world action-adventure game set in Los Santos, where players can switch between three protagonists.",
            author: "Rockstar Games",
            year: 2013,
            category: "Action-Adventure",
            rating: 5,
            review: "A masterpiece of open-world design with engaging characters and endless activities.",
            status: "Completed",
            isFavorite: true
        ),
        Game(
            title: "Hollow Knight: Silksong",
            image: "silksong",
            description: "A metroidvania adventure where Hornet explores a new kingdom full of bugs, traps, and mysteries.",
            author: "Team Cherry",
            year: 2025,
            category: "Metroidvania",
            rating: 5,
            review: "Highly anticipated sequel. Awaiting release and full reviews.",
            status: "Wishlist",
            isFavorite: false
        ),
        Game(
            title: "Red Dead Redemption",
            image: "rdr1",
            description: "A Western action-adventure game following John Marston’s quest for redemption in the early 1900s.",
            author: "Rockstar San Diego",
            year: 2010,
            category: "Action-Adventure",
            rating: 5,
            review: "A groundbreaking Western experience with a moving story and immersive world.",
            status: "Completed",
            isFavorite: true
        ),
        Game(
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
    ]
}
