//
//  Piece.swift
//  TicTackToeMinMax
//
//  Created by Erik Gadireddi on 26.05.2022.
//

import Combine
import Foundation
enum Piece: String {
    case X = "X"
    case O = "O"
    ///empty piece on board
    case E = " "
    var opposite: Piece {
        switch self {
        case .X:
            return .O
        case .O:
            return .X
        case .E:
            return .E
        }
    }
}
