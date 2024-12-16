//
//  WeatherDetailView.swift
//  Exam3_Yii_Enlai
//
//  Created by Enlai Yii on 11/14/24.
//

import SwiftUI

struct WeatherDetailView: View {
    var city: String
    var weather: String
    var temperature: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(city)
                .font(.headline)
                .foregroundColor(Color.customSecondary)
            
            Text("Weather: \(weather)")
                .font(.subheadline)
                .foregroundColor(Color.customSecondary)
            
            Text("Temperature: \(temperature)")
                .font(.subheadline)
                .foregroundColor(Color.customSecondary)
        }
        .padding()
        .background(Color.customPrimary)
        .ignoresSafeArea(.all)
    }
}
