//
//  ContentView.swift
//  TicTackToeMinMax
//
//  Created by Erik Gadireddi on 26.05.2022.
//

import SwiftUI

struct TicTacToeGameView: View {
    @StateObject var game = Game()
    @State var hintVisible: Bool = false
    var colums: [GridItem] =
    Array(repeating: .init(.fixed(80),spacing: 10), count: 3)
    /// Hint for player to make better decisions
    /// In addition it shows best move on the board (indexed from 0)
    var hintView: some View {
        VStack {
            Text(whoWins())
            Text("Best move" + String(game.bestMove))
        }
    }
    var body: some View {
        VStack{
            LazyVGrid(columns: colums) {
                ForEach(
                    Array(zip(game.board.position, game.board.position.indices)),
                    id:\.1) { item, index in
                        Text(item.rawValue)
                            .font(.title).bold()
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .onTapGesture {
                                game.onTap(index: index)
                            }
                    }.background(Color.black)
            }
            Button(hintVisible ? "Hide hint" : "Show hint", action: {
                hintVisible.toggle()
            })
            if hintVisible {
                hintView
            }
        }.sheet(isPresented: $game.showEnd) {
            VStack {
                Text(game.gameOver.rawValue).font(.title).bold()
                Button("Reset") {
                    game.reset()
                }
            }
        }
    }
    
    func whoWins() -> String {
        switch game.utility {
        case 1:
            return "Player X has advantage"
        case -1:
            return "Player O has advantage"
        default:
            return "Current state would end with draw"
        }
    }
}

private struct TicTacToeGameView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeGameView()
    }
}
