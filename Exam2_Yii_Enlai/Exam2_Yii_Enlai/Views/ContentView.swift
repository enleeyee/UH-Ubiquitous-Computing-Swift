//
//  ContentView.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var favoritesManager = FavoritesManager() // Create a StateObject for FavoritesManager
    
    var body: some View {
        VStack {
            TabView {
                HomeScreenView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .environmentObject(favoritesManager) // Inject into HomeScreenView
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Favorites")
                    }
                    .environmentObject(favoritesManager) // Inject into FavoritesView
                
                MapView()
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Map")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
