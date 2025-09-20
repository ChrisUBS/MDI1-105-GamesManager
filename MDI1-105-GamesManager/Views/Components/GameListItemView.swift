//
//  GameListItemView.swift
//  MDI1-105-GamesManager
//
//  Created by Christian Bonilla on 19/09/25.
//

import SwiftUI

struct GameListItemView: View {
    
    var game: Game
    
    var body: some View {
        HStack {
            Image(game.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 48, maxHeight: 48)
            VStack(alignment: .leading) {
                Text(game.title)
                Text(game.description)
                    .font(.system(size: 12))
                    .padding(.leading, 5)
            }
        }
    }
}
