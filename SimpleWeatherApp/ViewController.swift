//
//  ViewController.swift
//  SimpleWeatherApp
//
//  Created by Lisa J on 7/9/25.
//

import UIKit

class ViewController: UIViewController {

    private var currentWeatherView = CurrentWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            if let currentWeather = try await WeatherService().getCurrentWeather() {
                currentWeatherView.configure(city: currentWeather.name,
                                             temperature: currentWeather.main.temp,
                                             shortWeatherDescription: currentWeather.weather.first?.description ?? "n/a",
                                             highTemp: currentWeather.main.temp_max,
                                             lowTemp: currentWeather.main.temp_min)
                
            }
//            let fiveDayForecast = try await WeatherService().getFiveDayForecast()
            
            
            
        }
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(currentWeatherView)
        currentWeatherView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currentWeatherView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            currentWeatherView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            currentWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            currentWeatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

