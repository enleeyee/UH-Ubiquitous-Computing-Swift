//
//  CurrentWeatherModel.swift
//  CurrentWeatherApp
//
//  Created by Enlai Yii on 11/14/24.
//

import Foundation

struct CurrentWeatherModel {
    let conditionID: Int
    let cityName: String
    let weather: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
}
