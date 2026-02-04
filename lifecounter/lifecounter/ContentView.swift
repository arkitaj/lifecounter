//
//  ContentView.swift
//  lifecounter
//
//  Created by Arkita Jain on 1/29/26.
//

import SwiftUI

struct ContentView: View {
    // add player initial life count = 20
    //    @State private var player1Counter = 20
    //    @State private var player2Counter = 20
    // extra creditttt
    @State private var players: [(name: String, life: Int)] = [
        ("Player 1", 20),
        ("Player 2", 20),
        ("Player 3", 20),
        ("Player 4", 20)
    ]
    @State private var lifeChangeAmount = 5
    @State private var gameStarted = false
    
    // history screen
    @State private var history: [String] = []
    @State private var showHistory = false
    
    
    // extra credit..
    @State private var showNameEditor = false
    @State private var nameBeingEdited = ""
    @State private var editingPlayerIndex = 0
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                
                VStack(spacing: 15){
                    // add players (2 - 8)
                    Button("Add Player") {
                        players.append(("Player \(players.count + 1)", 20))
                    }
                    .disabled(players.count >= 8 || gameStarted)
                    
                    Button("History") {
                        showHistory = true
                    }
                    
                    HStack {
                        Text("Increase/decrease point total by:")
                        TextField("Amount", value: $lifeChangeAmount, format: .number)
                            .keyboardType(.numberPad) // numeric only
                            .frame(width: 60)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    ForEach(players.indices, id: \.self) { index in
                        VStack(spacing: 10) {
                            //                        Text("Player \(index + 1)")
                            //                            .font(.headline)
                            //
                            //                        Text("\(players[index])")
                            //                            .font(.system(size: 50, weight: .bold))
                            Text(players[index].name)
                                .font(.headline)
                                .onTapGesture {
                                    editingPlayerIndex = index
                                    nameBeingEdited = players[index].name
                                    showNameEditor = true
                                }
                            
                            Text("\(players[index].life)")
                                .font(.system(size: 50, weight: .bold))
                            
                            
                            HStack(spacing: 5) {
                                Button("-") {
                                    players[index].life -= lifeChangeAmount
                                    gameStarted = true
                                    
                                    history.append("\(players[index].name) lost \(lifeChangeAmount) life.")
                                    
                                    
                                }
                                
                                Button("+") {
                                    players[index].life += lifeChangeAmount
                                    gameStarted = true
                                    
                                    history.append("\(players[index].name) gained \(lifeChangeAmount) life.")
                                    
                                }
                            }
                        }
                        .padding(.top, index == 0 ? 0 : 25)
                    }
                    
                    //            VStack(spacing: 10) {
                    //                Text("Player 1")
                    //                    .font(.headline)
                    //                Text("\(player1Counter)")
                    //                    .font(.system(size: 50, weight: .bold))
                    //
                    //
                    //                // PLAYER ONE BUTTONS/CONTROLS
                    //                HStack(spacing: 10) {
                    //
                    //                    HStack(spacing: 5) {
                    //                        //                    Button("-5") {player1Counter -= 5}
                    //                        //                    Button("+5") {player1Counter += 5}
                    //                        //                    Button("-") {player1Counter -= 1}
                    //                        //                    Button("+") {player1Counter += 1}
                    //                        Button("-") { player1Counter -= lifeChangeAmount }
                    //                        Button("+") { player1Counter += lifeChangeAmount }
                    //
                    //                    }
                    //                }
                    //
                    //                // align player 1 layout w player 2...
                    //                .frame(maxWidth: .infinity)
                    //
                    //                // player 2 (unnested to help w UI layout)
                    //                VStack(spacing: 10) {
                    //                    Text("Player 2")
                    //                        .font(.headline)
                    //                        .padding(.top, 40) // evenly spaced between two players now
                    //
                    //
                    //                    Text("\(player2Counter)")
                    //                        .font(.system(size: 50, weight: .bold))
                    //
                    //                    HStack(spacing: 5) {
                    //                        //                    Button("-5") {player2Counter -= 5}
                    //                        //                    Button("+5") {player2Counter += 5}
                    //                        //                    Button("-") {player2Counter -= 1}
                    //                        //                    Button("+") {player2Counter += 1}
                    //                        Button("-") { player2Counter -= lifeChangeAmount } // NEW
                    //                        Button("+") { player2Counter += lifeChangeAmount } // NEW
                    //
                    //                    }
                    //
                    //                }
                    //                if player1Counter <= 0 {
                    //                    Text("Player 1 LOSES!")
                    //                        .font(.system(size: 50, weight: .bold))
                    //                        .foregroundColor(.red)
                    //                } else if player2Counter <= 0 {
                    //                    Text("Player 2 LOSES!")
                    //                        .font(.system(size: 50, weight: .bold))
                    //                        .foregroundColor(.red)
                    //                } else {
                    //                    EmptyView()
                    //                }
                    
                    // }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                
                .navigationDestination(isPresented: $showHistory) {
                    VStack {
                        Text("History")
                            .font(.largeTitle)
                            .padding()
                        
                        List(history, id: \.self) { entry in
                            Text(entry)
                        }
                    }
                }
                .alert("Edit Player Name", isPresented: $showNameEditor) {
                    TextField("Name", text: $nameBeingEdited)
                    
                    Button("Save") {
                        players[editingPlayerIndex].name = nameBeingEdited
                    }
                    
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
