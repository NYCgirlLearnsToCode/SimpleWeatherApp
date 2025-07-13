//
//  CurrentWeatherView.swift
//  SimpleWeatherApp
//
//  Created by Lisa J on 7/12/25.
//

import UIKit

class CurrentWeatherView: UIView {
    
    private let stackView = UIStackView()
    private let cityLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let shortWeatherDescriptionLabel = UILabel()
    private let highTempLabel = UILabel()
    private let lowTempLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupStackView()
        setupCityLabel()
        setupTemperatureLabel()
        setupShortWeatherDescriptionLabel()
        setupHighTempLabel()
        setupLowTempLabel()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24.0),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24.0),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24.0)
        ])
    }
    
    private func setupCityLabel() {
        stackView.addArrangedSubview(cityLabel)
        cityLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
    }
    
    private func setupTemperatureLabel() {
        stackView.addArrangedSubview(temperatureLabel)
        temperatureLabel.font = UIFont.systemFont(ofSize: 80, weight: .heavy)
    }
    
    private func setupShortWeatherDescriptionLabel() {
        stackView.addArrangedSubview(shortWeatherDescriptionLabel)
        shortWeatherDescriptionLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }

    
    private func setupHighTempLabel() {
        stackView.addArrangedSubview(highTempLabel)
        highTempLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    private func setupLowTempLabel() {
        stackView.addArrangedSubview(lowTempLabel)
        lowTempLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    func configure(city: String,
                   temperature: CGFloat,
                   shortWeatherDescription: String,
                   highTemp: CGFloat,
                   lowTemp: CGFloat) {
        cityLabel.text = city
        temperatureLabel.text = "\(Int(temperature.rounded()))"
        shortWeatherDescriptionLabel.text = shortWeatherDescription
        highTempLabel.text = "\(Int(highTemp.rounded()))"
        lowTempLabel.text = "\(Int(lowTemp.rounded()))"
    }
}
