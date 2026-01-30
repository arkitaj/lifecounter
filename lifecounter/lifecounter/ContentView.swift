//
//  ContentView.swift
//  lifecounter
//
//  Created by Arkita Jain on 1/29/26.
//

import SwiftUI

struct ContentView: View {
    // add player initial life count = 20
    @State private var player1Counter = 20
    @State private var player2Counter = 20
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Player 1")
                .font(.headline)
            Text("\(player1Counter)")
                .font(.system(size: 50, weight: .bold))
            
    
            // PLAYER ONE BUTTONS/CONTROLS
            HStack(spacing: 10) {

                HStack(spacing: 5) {
                    Button("-5") {player1Counter -= 5}
                    Button("+5") {player1Counter += 5}
                    Button("-") {player1Counter -= 1}
                    Button("+") {player1Counter += 1}
                }
            }
            
            
            // align player 1 layout w player 2...
            .frame(maxWidth: .infinity)

            // player 2 (unnested to help w UI layout)
            VStack(spacing: 10) {
                Text("Player 2")
                    .font(.headline)
                    
                Text("\(player2Counter)")
                    .font(.system(size: 50, weight: .bold))
                    
                HStack(spacing: 5) {
                    Button("-5") {player2Counter -= 5}
                    Button("+5") {player2Counter += 5}
                    Button("-") {player2Counter -= 1}
                    Button("+") {player2Counter += 1}
                        
                }
           
            }
            if player1Counter <= 0 {
                Text("Player 1 LOSES!")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.red)
            } else if player2Counter <= 0 {
                    Text("Player 2 LOSES!")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.red)
            } else {
                    EmptyView()
            }

        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview {
    ContentView()
}
