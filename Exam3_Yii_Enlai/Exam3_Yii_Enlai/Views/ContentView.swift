//
//  ContentView.swift
//  Exam3_Yii_Enlai
//
//  Created by Enlai Yii on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataModel = WeatherDataModel()
    
    var body: some View {
        TabView {
            HomeView(dataModel: dataModel)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            WeatherView(dataModel: dataModel)
                .tabItem {
                    Image(systemName: "cloud.fill")
                    Text("Weather")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
