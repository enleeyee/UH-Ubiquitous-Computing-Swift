//
//  ContentView.swift
//  Exercise4_Yii_Enlai
//
//  Created by Enlai Yii on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var leftWinRate: Int = 0
    @State private var rightWinRate: Int = 0
    
    var body: some View {
        VStack {
            TabView {
                GameView(leftWinRate: $leftWinRate, rightWinRate: $rightWinRate)
                ScoreView(leftWinRate: $leftWinRate, rightWinRate: $rightWinRate)
            }
        }
    }
}

#Preview {
    ContentView()
}
