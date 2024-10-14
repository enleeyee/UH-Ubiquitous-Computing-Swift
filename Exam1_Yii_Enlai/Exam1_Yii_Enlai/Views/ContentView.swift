//
//  ContentView.swift
//  Exam1_Yii_Enlai
//
//  Created by Enlai Yii on 9/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var winnieRate: Double = 0
    @State private var dumboRate: Double = 0
    @State private var pinocchioRate: Double = 0
    @State private var helloKittyRate: Double = 0
    
    var body: some View {
        VStack {
            TabView {
                HomeView(winnieRate: $winnieRate, dumboRate: $dumboRate, pinocchioRate: $pinocchioRate, helloKittyRate: $helloKittyRate)
                RatingView(winnieRate: $winnieRate, dumboRate: $dumboRate, pinocchioRate: $pinocchioRate, helloKittyRate: $helloKittyRate)
            }
        }
        .background(Color(red: 255/250.0, green: 244/250.0, blue: 234/250.0))
    }
}

#Preview {
    ContentView()
}
