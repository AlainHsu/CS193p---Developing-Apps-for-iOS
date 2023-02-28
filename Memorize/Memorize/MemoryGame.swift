//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alain Hsu on 2023/2/28.
//

import Foundation

struct MemoryGame<CardContent> {
    // make cards private to prevent it from changing
    private(set) var cards: [Card]

    func choose(_ card: Card) {}

    init(numberOfPairsOfCards: Int, createCardContent:(Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            // function as paramater
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
