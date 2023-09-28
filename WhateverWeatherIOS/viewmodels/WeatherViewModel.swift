//
//  WeatherViewModel.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var currentCity: String = "London"
    @Published var weatherData: WeatherData.Entity? = nil
    @Published var unit: String = "°C"
    
    private var weatherManager: WeatherManager? = nil
    
    init() {
        self.weatherManager = WeatherManager(delegate: self)
        getWeather()
        print("Aobaaa")
    }
    
    func getWeather() {
        weatherManager?.fetchWeather(query: currentCity)
    }
    
    /*func addLocation() {
        let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
        locations.append(newLocation)
    }
     */
    // Binding
    func currentCityBinding() -> Binding<String> {
            .init { [weak self] in
                self?.currentCity ?? ""
            } set: { _ in
            }
        }
}

extension WeatherViewModel: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherData.Entity) {
        self.weatherData = weather
        print("Got weather")
    }
    
    func didFailWithError(error: Error) {
        self.weatherData = nil
        print(error)
    }
}
