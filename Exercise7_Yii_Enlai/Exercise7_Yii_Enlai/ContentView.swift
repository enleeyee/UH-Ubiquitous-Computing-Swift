//
//  ContentView.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var selectedBreeds = SelectedBreeds()
    
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .environmentObject(selectedBreeds)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                PairsView()
                    .environmentObject(selectedBreeds)
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Pairs")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

