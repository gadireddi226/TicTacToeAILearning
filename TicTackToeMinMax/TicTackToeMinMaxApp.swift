//
//  TicTackToeMinMaxApp.swift
//  TicTackToeMinMax
//
//  Created by Erik Gadireddi on 26.05.2022.
//

import SwiftUI

@main
struct TicTackToeMinMaxApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
            TicTacToeGameView()
                    .navigationTitle("Tic Tac Toe")
            }
        }
    }
}
