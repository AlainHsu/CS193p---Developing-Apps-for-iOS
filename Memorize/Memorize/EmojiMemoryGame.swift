//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alain Hsu on 2023/2/28.
//

import SwiftUI

class EmojiMemoryGame:  ObservableObject {
    static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐯", "🐨", "🐻‍❄️", "🐮", "🐷", "🐽", "🐸", "🙊", "🙉", "🙈", "🐵", "🐒", "🐔", "🐧", "🐦"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    // make model private to prevent it from changing
    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
