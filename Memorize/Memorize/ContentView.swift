//
//  ContentView.swift
//  Memorize
//
//  Created by Alain Hsu on 2023/2/24.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🦁", "🐯", "🐨", "🐻‍❄️", "🐮", "🐷", "🐽", "🐸", "🙊", "🙉", "🙈", "🐵", "🐒", "🐔", "🐧", "🐦"]

    @State var emojiCount = 12
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))], content: {
                    ForEach(0 ..< emojiCount, id: \.self) { index in
                        CardView(content: emojis[index])
                    }
                })
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }.padding()

        }.padding()
            .foregroundColor(.blue)
    }

    var remove: some View {
        Button(action: {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        }) {
            Image(systemName: "minus.circle").font(.largeTitle)
        }
    }

    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }) {
            Image(systemName: "plus.circle").font(.largeTitle)
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 15).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15).strokeBorder(lineWidth: 3, antialiased: true)
                Text(content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)
            }
        }
        .aspectRatio(2 / 3, contentMode: .fit)
        .foregroundColor(.red)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
