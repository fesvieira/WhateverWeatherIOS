//
//  WeatherViewModel.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var currentCity: String
    @Published var weatherData: WeatherData.Entity? = nil
    @Published var isCelsius: Bool = false
    @Published var isFetchingData = false
    
    private var weatherManager: WeatherManager? = nil
    
    init() {
        self.currentCity = "London"
        self.weatherManager = WeatherManager(delegate: self)
        getWeather()
    }
    
    func getWeather() {
        self.isFetchingData = true
        self.weatherData = nil
        self.weatherManager?.fetchWeather(query: self.currentCity)
    }
    
    func setUnit(isCelsius: Bool) {
        self.isCelsius = isCelsius
    }
    
    // Binding
    func currentCityBinding() -> Binding<String> {
            .init { [weak self] in
                self?.currentCity ?? ""
            } set: { [weak self] city in
                self?.currentCity = city
            }
        }
}

extension WeatherViewModel: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherData.Entity) {
        DispatchQueue.main.async {
            self.weatherData = weather
            self.isFetchingData = false
        }
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            self.weatherData = nil
            self.isFetchingData = false
        }
    }
}
