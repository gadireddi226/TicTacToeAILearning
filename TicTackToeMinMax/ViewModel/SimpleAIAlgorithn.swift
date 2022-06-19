//
//  SimpleAIAlgorithn.swift
//  TicTackToeMinMax
//
//  Created by Erik Gadireddi on 20.06.2022.
//

import Foundation
extension Game {
    static func findBestMove(_ board: Board) -> Move {
        var bestEval = Int.min
        var bestMove = -1
        for move in board.legalMoves {
            let result = minimax(board.move(move), board.turn, maximazing: false)
            if result > bestEval {
                bestEval = result
                bestMove = move
            }
        }
        return bestMove
    }
    //finding best possible outcome
    static func minimax(_ board: Board, _ originalPlayer: Piece, maximazing: Bool) -> Int {
        var alpha: Int
        if board.isWin && originalPlayer == board.turn.opposite {
            alpha = 1;
            return alpha
        } else if board.isWin && originalPlayer != board.turn.opposite {
            alpha = -1
            return alpha
        } else if board.isDraw {
            alpha = 0
            return alpha
        }
        
        if maximazing {
            var bestEval = Int.min
            for move in board.legalMoves {
                let result = minimax(board.move(move), originalPlayer, maximazing: false)
                bestEval = max(result, bestEval)
            }
            alpha = bestEval
            return alpha
        } else {
            var worstEval = Int.max
            for move in board.legalMoves {
                let result = minimax(board.move(move), originalPlayer, maximazing: true)
                worstEval = min(worstEval,result)
            }
            alpha = worstEval
            return alpha
        }
    }
}
