//
//  CurrentWeather.swift
//  SimpleWeatherApp
//
//  Created by Lisa J on 7/9/25.
//

import Foundation

struct CurrentWeather: Codable {
    let coord: Coordinate
    let weather: [WeatherSummary]
    let base: String
    let main: MainLevels
    let name: String
}

struct Coordinate: Codable {
    let lon: CGFloat
    let lat: CGFloat
}

struct WeatherSummary: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct MainLevels: Codable {
    let temp: CGFloat
    let feels_like: CGFloat
    let temp_min: CGFloat
    let temp_max: CGFloat
    let pressure: CGFloat
    let humidity: CGFloat
    let sea_level: CGFloat
    let grnd_level: CGFloat
}
