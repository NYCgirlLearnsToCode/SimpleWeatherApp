//
//  WeatherService.swift
//  SimpleWeatherApp
//
//  Created by Lisa J on 7/9/25.
//

import Foundation

class WeatherService {

    func getCurrentWeather() async throws -> CurrentWeather? {
        let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=40.7447&lon=73.9485&appid=\(apiKey)"
        do {
            let currentWeather = try await NetworkManager.shared.request(endpoint: urlString, type: CurrentWeather.self)
            return currentWeather
        } catch {
            print(error)
        }
        return nil
    }
    
    func getFiveDayForecast() async throws -> Weather? {
        let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=40.7447&lon=73.9485&appid=\(apiKey)"
        
        do {
            let weather = try await NetworkManager.shared.request(endpoint: urlString, type: Weather.self)
            return weather
        } catch {
            print(error)
        }
        return nil
    }
}
