//
//  Game.swift
//  TicTackToeMinMax
//
//  Created by Erik Gadireddi on 01.06.2022.
//

import SwiftUI

class Game: ObservableObject {
    @Published var board: Board = Board()
    @Published var utility: Int = 0;
    @Published var bestMove: Int = -1
    
    @Published var showEnd: Bool = false
    @Published var gameOver: GameOver = .none {
        didSet {
            if gameOver != .none {
                showEnd = true
            }
        }
    }

// MARK: User actions
    func onTap(index: Int) {
        board = board.move(index)
        utility = Game.minimax(board, board.turn, maximazing: true)
        bestMove = Game.findBestMove(board)
        if board.isWin {
            if board.turn == .X {
                gameOver = .O
            } else {
                gameOver = .X
            }
        } else if board.isDraw {
            gameOver = .draw
        }
    }
    
    func reset() {
        board = Board()
        gameOver = .none
        showEnd = false
        bestMove = -1
        utility = 0
    }
}

// MARK: Final state of game
extension Game {
    enum GameOver: String {
        case X = "X wins"
        case O = "O wins"
        case draw
        case none
    }
}
