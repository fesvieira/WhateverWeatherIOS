//
//  WeatherService.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherData.Entity)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = K.weatherURL
    let weatherPath = "/v1/forecast.json?key=\(K.weatherKey)"
    var baseURL: String { "\(weatherURL)\(weatherPath)" }
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(query: String) {
        let urlString = "\(baseURL)&q=\(query)&days=3"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data, let weather = self.parseJSON(safeData) {
                    self.delegate?.didUpdateWeather(self, weather: weather)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherData.Entity? {
        let decoder = JSONDecoder()
        do {
            let decodedData: WeatherData.Entity = try decoder.decode(WeatherData.Entity.self, from: weatherData)
            print("success")
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
}
