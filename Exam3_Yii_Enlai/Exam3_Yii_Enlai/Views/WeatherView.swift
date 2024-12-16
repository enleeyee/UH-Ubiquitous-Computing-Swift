//
//  WeatherView.swift
//  Exam3_Yii_Enlai
//
//  Created by Enlai Yii on 11/14/24.
//

import SwiftUI

let cities = [
    ("New York", 40.7128, -74.0060),
    ("Tokyo", 35.6895, 139.6917),
    ("Oslo", 59.9139, 10.7522),
    ("Moscow", 55.7558, 37.6173),
    ("Paris", 48.8566, 2.3522),
    ("Sydney", -33.8688, 151.2093),
    ("Cairo", 30.0444, 31.2357),
    ("Cape Town", -33.9249, 18.4241),
    ("Mexico City", 19.4326, -99.1332),
    ("Toronto", 43.65107, -79.347015),
    ("Mawsynram, India", 25.2986, 91.5822),
    ("Cherrapunji, India", 25.2841, 91.7174),
    ("Tutunendo, Colombia", 5.4167, -76.5833),
    ("Yuma, Arizona, USA", 32.6927, -114.6277),
    ("Aswan, Egypt", 24.0889, 32.8998),
    ("Phoenix, Arizona, USA", 33.4484, -112.0740),
    ("Aomori City, Japan", 40.8246, 140.7406),
    ("Sapporo, Japan", 43.0618, 141.3545),
    ("Toyama, Japan", 36.6953, 137.2113),
    ("Istanbul, Turkey", 41.0082, 28.9784),
    ("Yakutsk, Russia", 62.0355, 129.6755),
    ("Zurich, Switzerland", 47.3769, 8.5417)
]

struct WeatherView: View {
    @ObservedObject var dataModel: WeatherDataModel
    
    @StateObject private var weatherManager = CurrentWeatherManager()
    @State private var weatherData: [CurrentWeatherModel] = []
    @State private var fetchedCities: Set<String> = []

    var body: some View {
        VStack(spacing: 20) {
            Text(dataModel.target.uppercased())
                .font(.largeTitle)
                .foregroundColor(.customPrimary)
            
            if !dataModel.imageName.isEmpty {
                Image(dataModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 400, maxHeight: 400)
                    .padding()
            }
            
            if let firstWeather = weatherData.first {
                Text("City: \(firstWeather.cityName)")
                    .font(.title2)
                    .foregroundColor(.customPrimary)
            }

            if let firstWeather = weatherData.first {
                Text("Weather: \(firstWeather.weather)")
                    .font(.title2)
                    .foregroundColor(.customPrimary)
            }

            Button(action: {
                fetchWeatherData()
            }) {
                Text("Fetch City With \(dataModel.target.capitalized) Weather")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.customPrimary)
                    .foregroundColor(Color.customSecondary)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }

            List(weatherData, id: \.cityName) { weather in
                WeatherDetailView(city: weather.cityName, weather: weather.weather, temperature: weather.temperatureString)
            }
            .listStyle(PlainListStyle())
            .background(Color.customPrimary)
            
            Rectangle()
                .frame(height: 0)
                .background(Color.customPrimary)
                .opacity(1)
        }
        .padding()
        .background(Color(red: 218/255, green: 243/255, blue: 236/255))
    }

    func fetchWeatherData() {
        weatherData = []
        fetchedCities = []
        
        for city in cities {
            if !fetchedCities.contains(city.0) {
                print("Fetching weather for \(city.0)")
                fetchedCities.insert(city.0)
                weatherManager.fetchWeatherByLatitudeAndLongitude(latitude: city.1, longitude: city.2)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    if var currentWeather = weatherManager.currentWeather {
                        weatherData.append(currentWeather)
                    }
                }
            }
        }
    }
}

#Preview {
    WeatherView(dataModel: WeatherDataModel())
}
