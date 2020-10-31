//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Jeru Kim on 10/30/20.
//  Copyright © 2020 Jeru Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let moveSet = ["Rock", "Paper", "Scissor"]
    
    private var shouldWin: Bool { Bool.random() }
    private var move: Int { Int.random(in: 0...2) }
    
    @State private var score = 0
    @State private var round = 0
    
    func playMove(_ playerMove: Int) {
        if (self.shouldWin) {
            var winningMove = self.move + 1
            
            if (winningMove > self.moveSet.count - 1) {
                winningMove = 0
            }
            
            if (playerMove == winningMove) {
                self.score += 1
            }
        } else {
            var losingMove = self.move - 1
            
            if (losingMove < 0) {
                losingMove = self.moveSet.count - 1
            }
            
            if (playerMove == losingMove) {
                self.score += 1
            }
        }
        
        self.round += 1
    }

    var body: some View {
        VStack {
            Text("Score: \(score)")
                .padding()
            
            if (round < 9) {
                Text("\(shouldWin ? "Win" : "Lose") against \(moveSet[move])")
                    .padding()
                
                HStack {
                    ForEach(0 ..< moveSet.count) { move in
                        Button(self.moveSet[move]) {
                            self.playMove(move)
                        }
                    }
                }.padding()
                
            } else {
                Button("Play Again") {
                    self.score = 0
                    self.round = 0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
