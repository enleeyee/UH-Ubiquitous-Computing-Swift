//
//  WeatherView.swift
//  Exam3_Yii_Enlai
//
//  Created by Enlai Yii on 11/14/24.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("RAINBOW")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)

            Image("rainbow")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()

            VStack(spacing: 8) {
                Text("City: Cairo")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("Weather: Clear")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Button(action: {
                print("fetch city pressed")
            }) {
                Text("Fetch City With Rainbow Weather")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }

            List {
                WeatherDetailView(city: "New York", weather: "Clear", temperature: "7.8 °C")
                WeatherDetailView(city: "Cairo", weather: "Clear", temperature: "21.3 °C")
            }
            .listStyle(PlainListStyle())
        }
        .padding()
        .background(Color(red: 240/255, green: 255/255, blue: 255/255))
    }
}

struct WeatherDetailView: View {
    var city: String
    var weather: String
    var temperature: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(city)
                .font(.headline)
                .foregroundColor(.white)
            
            Text("Weather: \(weather)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            Text("Temperature: \(temperature)")
                .font(.subheadline)
                .foregroundColor(.white)
            
            Divider()
                .background(Color.white)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(8)
        .padding(.horizontal, 20)
    }
}

#Preview {
    WeatherView()
}
