//
//  TicTackToeMinMaxTests.swift
//  TicTackToeMinMaxTests
//
//  Created by Erik Gadireddi on 26.05.2022.
//

import XCTest
@testable import TicTackToeMinMax

class TicTackToeMinMaxTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let toWinEasyPosition: [Piece] = [.X, .O, .X,
                                           .X, .E, .O,
                                           .E, .E, .O]
         let testBoard1: Board = Board(position: toWinEasyPosition, turn: .X, lastMove: 8)
        let answer1 = Game.findBestMove(testBoard1)
         XCTAssert(answer1 == 6)
    }

    func testShouldBlock() throws {
        // must block O's win
         let toBlockPosition: [Piece] = [.X, .E, .E,
                                         .E, .E, .O,
                                         .E, .X, .O]
         let testBoard2: Board = Board(position: toBlockPosition, turn: .X, lastMove: 8)
        let answer2 = Game.findBestMove(testBoard2)
         print(answer2)
        XCTAssert(answer2 == 2)
    }

}
