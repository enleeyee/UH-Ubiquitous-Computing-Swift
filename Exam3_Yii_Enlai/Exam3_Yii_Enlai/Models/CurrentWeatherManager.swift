//
//  CurrentWeatherManager.swift
//  CurrentWeatherApp
//
//  Created by Enlai Yii on 11/14/24.
//

import Foundation
import Combine

class CurrentWeatherManager: ObservableObject {
    @Published var currentWeather: CurrentWeatherModel?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private var apiKey = "5c4eb42962bb2ff8a0370174af5c6fd5"

    private let weatherBaseURL = "https://api.openweathermap.org/data/2.5/weather?units=imperial"

    // MARK: - Public Fetch Methods

    func fetchWeatherByCity(cityName: String) {
        let urlString = "\(weatherBaseURL)&appid=\(apiKey)&q=\(cityName)"
        performRequest(with: urlString)
        print(urlString)
    }
    
    func fetchWeatherByLatitudeAndLongitude(latitude: Double, longitude: Double) {
        let urlString = "\(weatherBaseURL)&appid=\(apiKey)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
        print(urlString)
    }
    
    // MARK: - Networking
    
    private func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = "Network error: \(error.localizedDescription)"
                    return
                }
                
                if let safeData = data, let weather = self?.parseJSON(weatherData: safeData) {
                    self?.currentWeather = weather
                } else {
                    self?.errorMessage = "Failed to parse weather data."
                }
            }
        }
        task.resume()
    }

    // MARK: - JSON Parsing
    
    private func parseJSON(weatherData: Data) -> CurrentWeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrentWeatherData.self, from: weatherData)
            
            let id = decodedData.weather.first?.id ?? 0
            let description = decodedData.weather.first?.description ?? "No description available"
            let temp = decodedData.main.temp
            let name = decodedData.name.isEmpty ? "Unknown Location" : decodedData.name
            
            let weather = CurrentWeatherModel(conditionID: id, cityName: name, weather: description, temperature: temp)
            return weather
        } catch {
            self.errorMessage = "Decoding error: \(error.localizedDescription)"
            return nil
        }
    }
}
