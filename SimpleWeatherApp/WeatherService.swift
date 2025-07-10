//
//  WeatherService.swift
//  SimpleWeatherApp
//
//  Created by Lisa J on 7/9/25.
//

import Foundation

class WeatherService {

    func getCurrentWeather() async throws -> CurrentWeather? {
//        https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
        //TODO: make api key secret
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=40.7447&lon=73.9485&appid=ca0e9f6ee874340b858f8697fd250a56"
        do {
            let currentWeather = try await NetworkManager.shared.request(endpoint: urlString, type: CurrentWeather.self)
            return currentWeather
        } catch {
            print(error)
        }
        return nil
    }
    
    func getFiveDayForecast() {
        // this gives 5 day forecast with weather for 3 hours segments for each day
//        api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}
    }
}
