//
//  Board.swift
//  TicTackToeMinMax
//
//  Created by Erik Gadireddi on 01.06.2022.
//

// a move is an integer 0-8 indicating a place to put a piece
typealias Move = Int

struct Board {
    let position: [Piece]
    let turn: Piece
    let lastMove: Move
    // by default the board is empty and X goes first
    // lastMove being -1 is a marker of a start position
    init(position: [Piece] = [.E, .E, .E, .E, .E, .E, .E, .E, .E], turn: Piece = .X, lastMove: Int = -1) {
        self.position = position
        self.turn = turn
        self.lastMove = lastMove
    }
    // location can be 0-8, indicating where to move
    // return a new board with the move played
    func move(_ location: Move) -> Board {
        var tempPosition = position
        tempPosition[location] = turn
        return Board(position: tempPosition, turn: turn.opposite, lastMove: location)
    }
    
    // the legal moves in a position are all of the empty squares
    var legalMoves: [Move] {
        return position.indices.filter { position[$0] == .E }
    }
    
    var isWin: Bool {
        return
            position[0] == position[1] && position[0] == position[2] && position[0] != .E || // row 0
            position[3] == position[4] && position[3] == position[5] && position[3] != .E || // row 1
            position[6] == position[7] && position[6] == position[8] && position[6] != .E || // row 2
            position[0] == position[3] && position[0] == position[6] && position[0] != .E || // col 0
            position[1] == position[4] && position[1] == position[7] && position[1] != .E || // col 1
            position[2] == position[5] && position[2] == position[8] && position[2] != .E || // col 2
            position[0] == position[4] && position[0] == position[8] && position[0] != .E || // diag 0
            position[2] == position[4] && position[2] == position[6] && position[2] != .E // diag 1
        
    }
    
    var isDraw: Bool {
        return !isWin && legalMoves.count == 0
    }
}
