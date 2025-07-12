//
//  Weather.swift
//  SimpleWeatherApp
//
//  Created by Lisa J on 7/9/25.
//

import Foundation

struct Weather: Codable {
    let cnt: Int
    let list: [Forecast]
}

struct Forecast: Codable {
    let dt: Int
    let main: Temp
}

struct Temp: Codable {
    let temp: CGFloat
    let feels_like: CGFloat
    let temp_min: CGFloat
    let temp_max: CGFloat
    let pressure: Int
    let sea_level: Int
    let grnd_level: Int
    let humidity: Int
    let temp_kf: CGFloat
}

