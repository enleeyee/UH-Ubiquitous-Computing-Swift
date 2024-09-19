//
//  GameView.swift
//  Exercise4_Yii_Enlai
//
//  Created by Enlai Yii on 9/16/24.
//

import SwiftUI

struct GameView: View {
    @Binding var leftWinRate: Int
    @Binding var rightWinRate: Int
    
    @State private var leftDragonImage: String = "0_HOD_logo"
    @State private var rightDragonImage: String = "0_HOD_logo"
    
    @State private var middleText: String = "Prepare for the battle!"
    
    @State private var leftDragonPosition: Int = 0
    @State private var rightDragonPosition: Int = 0
    
    @State private var isGameOver: Bool = false
    
    @State private var dragons: [Int: String] = [
        0: "1_Balerion",
        1: "1_Meraxes",
        2: "1_Sheepstealer",
        3: "2_Silverwing",
        4: "2_Meleys",
        5: "2_Quicksilver",
        6: "3_Stormcloud",
        7: "3_Drogon",
        8: "3_Viserion"
    ]
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        
        VStack {
            
            if verticalSizeClass == .regular
            {
                VStack {
                    Image("0_HOD_text")
                        .resizable()
                        .frame(width: 350, height: 50)
                    
                    HStack {
                        VStack {
                            Text("Player 1")
                                .padding()
                                .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                            
                            Image(leftDragonImage)
                                .resizable()
                                .frame(width: 150, height: 150)
                        }
                        
                        VStack {
                            Text("Player 2")
                                .padding()
                                .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                            
                            Image(rightDragonImage)
                                .resizable()
                                .frame(width: 150, height: 150)
                        }
                    }
                    
                    Spacer()
                    
                    Text(middleText)
                        .padding()
                        .font(Font.custom("AcademyEngravedLetPlain", size: 25))
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            Text("Restart")
                                .padding()
                                .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                                .bold()
                            
                            Button(action: {
                                restartGame()
                            }) {
                                Image("0_refresh_arrows")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                        }
                        
                        VStack {
                            Text("Fight")
                                .padding()
                                .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                                .bold()
                            
                            Button(action: {
                                chooseRandomDragon()
                            }) {
                                Image("0_crossing-swords")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            .disabled(isGameOver)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            } else {
                HStack {
                    Image("0_HOD_text")
                        .resizable()
                        .frame(width: 350, height: 50)
                    
                    Text(middleText)
                        .padding()
                        .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                }
                
                HStack {
                    VStack {
                        Text("Player 1")
                            .padding()
                            .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                        
                        Image(leftDragonImage)
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    
                    VStack {
                        Text("Player 2")
                            .padding()
                            .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                        
                        Image(rightDragonImage)
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Restart")
                            .padding()
                            .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                            .bold()
                        
                        Button(action: {
                            restartGame()
                        }) {
                            Image("0_refresh_arrows")
                                .resizable()
                                .frame(width: 150, height: 150)
                        }
                    }
                    
                    VStack {
                        Text("Fight")
                            .padding()
                            .font(Font.custom("AcademyEngravedLetPlain", size: 35))
                            .bold()
                        
                        Button(action: {
                            chooseRandomDragon()
                        }) {
                            Image("0_crossing-swords")
                                .resizable()
                                .frame(width: 150, height: 150)
                        }
                        .disabled(isGameOver)
                    }
                }
                .padding()
            }
        }
        .tabItem {
            Image("fire_off")
            Text("Game")
        }
            
    }
    
    func chooseRandomDragon() {
        leftDragonPosition = Int.random(in: 0..<dragons.count)
        repeat {
            rightDragonPosition = Int.random(in: 0..<dragons.count)
        } while (leftDragonPosition == rightDragonPosition)
        
        leftDragonImage = dragons[leftDragonPosition] ?? "0_HOD_logo"
        rightDragonImage = dragons[rightDragonPosition] ?? "0_HOD_logo"
        
        getFightResults()
    }
    
    func getFightResults() {
        let leftDragonName = parseDragonName(from: dragons[leftDragonPosition] ?? "")
        let rightDragonName = parseDragonName(from: dragons[rightDragonPosition] ?? "")
        
        if leftDragonPosition > rightDragonPosition {
            leftWinRate += 1
            middleText = "\(leftDragonName) is stronger.\nPlayer 1 wins this round."
        } else {
            rightWinRate += 1
            middleText = "\(rightDragonName) is stronger.\nPlayer 2 wins this round."
        }
        
        if leftWinRate > 2 || rightWinRate > 2 {
            gameIsOver()
        }
    }
    
    func parseDragonName(from dragonKey: String) -> String {
        let parts = dragonKey.components(separatedBy: "_")
        if parts.count > 1 {
            return parts[1]
        }
        return "No_Name"
    }

    func gameIsOver() {
        if leftWinRate > 2 {
            middleText = "Player 1 won! (\(leftWinRate), \(rightWinRate))\nRestart the game."
        }
        if rightWinRate > 2 {
            middleText = "Player 2 won! (\(leftWinRate), \(rightWinRate))\nRestart the game."
        }
        isGameOver = true
    }
    
    func restartGame() {
        leftDragonImage = "0_HOD_logo"
        rightDragonImage = "0_HOD_logo"
        middleText = "Prepare for the battle!"
        isGameOver = false
        leftWinRate = 0
        rightWinRate = 0

    }
}

#Preview {
    GameView(
        leftWinRate: .constant(0),
        rightWinRate: .constant(0)
    )
}
