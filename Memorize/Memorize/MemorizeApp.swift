//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alain Hsu on 2023/2/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
