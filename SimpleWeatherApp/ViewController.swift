//
//  ViewController.swift
//  SimpleWeatherApp
//
//  Created by Lisa J on 7/9/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            try await WeatherService().getCurrentWeather()
        }
    }
}

