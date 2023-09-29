//
//  Constants.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation

enum K {
    struct WeatherService {
        static let weatherURL = "https://api.weatherapi.com"
        static let weatherKey = "df2ee2735a15489b8e2122333231408"
    }
    
    struct UserDefaults {
        static let defaultCity = "London"
        static let defaultIsCelsius = false
        
        // Keys
        static let isCelsius = "is_celsius"
        static let currentCity = "current_city"
    }
}
