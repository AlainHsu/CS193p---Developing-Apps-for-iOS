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

    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
//        print("\(cards)")
    }

    func index(of card: Card) -> Int {
        for index in 0 ..< cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // bogus!
    }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0 ..< numberOfPairsOfCards {
            // function as parameter
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
