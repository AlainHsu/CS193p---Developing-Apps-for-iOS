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
            Title()
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))], content: {
                    ForEach(0 ..< emojiCount, id: \.self) { index in
                        CardView(content: emojis[index])
                    }
                })
            }
            Spacer()
            HStack {
                remove().onTapGesture {
                    if emojiCount > 0 {
                        emojiCount -= 1
                    }
                }
                Spacer()
                add().onTapGesture {
                    if emojiCount < emojis.count {
                        emojiCount += 1
                    }
                }
            }.padding()

        }.padding()
            .foregroundColor(.blue)
    }
}

struct Title: View {
    var body: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .foregroundColor(.black)
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

struct AnimalTheme: View {
    var body: some View {
        VStack {
            Image(systemName: "hare").font(.largeTitle)
            Text("Animals")
        }
    }
}

struct FoodTheme: View {
    var body: some View {
        VStack {
            Image(systemName: "carrot").font(.largeTitle)
            Text("Animals")
        }
    }
}

struct ActivityTheme: View {
    var body: some View {
        VStack {
            Image(systemName: "soccerball").font(.largeTitle)
            Text("Animals")
        }
    }
}

struct remove: View {
    var body: some View {
        Image(systemName: "minus.circle").font(.largeTitle)
    }
}

struct add: View {
    var body: some View {
        Image(systemName: "plus.circle").font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
