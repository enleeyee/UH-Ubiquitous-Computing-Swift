//
//  ContentView.swift
//  Exam3_Yii_Enlai
//
//  Created by Enlai Yii on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                WeatherView()
                    .tabItem {
                        Image(systemName: "cloud.fill")
                        Text("Weather")
                    }
            }
            .accentColor(.blue)
//            .toolbarBackground(Color(red: 176/255, green: 196/255, blue: 222/255), for: .tabBar)
        }
    }
}

#Preview {
    ContentView()
}
