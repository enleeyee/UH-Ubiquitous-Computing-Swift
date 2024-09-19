//
//  ScoreView.swift
//  Exercise4_Yii_Enlai
//
//  Created by Enlai Yii on 9/16/24.
//

import SwiftUI

struct ScoreView: View {
    
    @Binding var leftWinRate: Int
    @Binding var rightWinRate: Int
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        VStack {
            
            if verticalSizeClass == .regular {
                VStack {
                    Image("0_HOD_text")
                        .resizable()
                        .frame(width: 350, height: 50)
                    
                    Text("Player 1")
                        .padding()
                        .font(Font.custom("AcademyEngravedLetPlain", size: 50))
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Image("0_HOD_logo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .opacity(index < leftWinRate ? 1.0 : 0.1)
                        }
                    }
                    
                    
                    Text("Player 2")
                        .padding()
                        .font(Font.custom("AcademyEngravedLetPlain", size: 50))
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Image("0_HOD_logo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .opacity(index < rightWinRate ? 1.0 : 0.1)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            } else {
                HStack {
                    VStack {
                        Image("0_HOD_text")
                            .resizable()
                            .frame(width: 700, height: 100)
                        
                        HStack {
                            VStack {
                                Text("Player 1")
                                    .padding()
                                    .font(Font.custom("AcademyEngravedLetPlain", size: 50))
                                
                                HStack {
                                    ForEach(0..<3) { index in
                                        Image("0_HOD_logo")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .opacity(index < leftWinRate ? 1.0 : 0.1)
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("Player 2")
                                    .padding()
                                    .font(Font.custom("AcademyEngravedLetPlain", size: 50))
                                
                                HStack {
                                    ForEach(0..<3) { index in
                                        Image("0_HOD_logo")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .opacity(index < rightWinRate ? 1.0 : 0.1)
                                    }
                                }
                                
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .tabItem {
            Image("score_off")
            Text("Score")
        }
    }
}

#Preview {
    ScoreView(
        leftWinRate: .constant(0),
        rightWinRate: .constant(0)
    )
}
