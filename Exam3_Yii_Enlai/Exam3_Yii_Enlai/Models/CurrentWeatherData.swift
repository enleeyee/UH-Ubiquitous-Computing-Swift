//
//  CurrentWeatherData.swift
//  CurrentWeatherApp
//
//  Created by Enlai Yii on 11/14/24.
//

import Foundation

struct CurrentWeatherData: Decodable {
    let coord: Coord?
    let weather: [Weather]
    let base: String?
    let main: Main
    let visibility: Double?
    let wind: Wind?
    let clouds: Clouds?
    let rain: Rain?
    let snow: Snow?
    let dt: Int
    let sys: Sys?
    let timezone: Int?
    let id: Int
    let name: String
    let cod: Int
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
    let sea_level: Double
    let grnd_level: Double
}

struct Wind: Decodable {
    let speed: Double
    let deg: Double
    let gust: Double
}

struct Clouds: Decodable {
    let all: Double
}

struct Rain: Decodable {
    let oneHour: Double?

    private enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

struct Snow: Decodable {
    let oneHour: Double?

    private enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

struct Sys: Decodable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
