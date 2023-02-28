//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alain Hsu on 2023/2/28.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐯", "🐨", "🐻‍❄️", "🐮", "🐷", "🐽", "🐸", "🙊", "🙉", "🙈", "🐵", "🐒", "🐔", "🐧", "🐦"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
            emojis[pairIndex]
        }
    }

    // make model private to prevent it from changing
    private var model: MemoryGame<String> = createMemoryGame()

    var card: [MemoryGame<String>.Card] {
        return model.cards
    }
}
