//
//  WeatherData.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation

struct WeatherData {
    let location: Location
    let weather: CurrentWeather
    let forecast: Forecast
}

struct Location {
    let name: String
    let region: String
    let country: String
    let lat: Float
    let lon: Float
    let tz_id: String
    let localtime_epoch: Double
    let localtime: String
}

struct CurrentWeather{
    let last_updated_epoch: Double
    let last_updated: String
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    let condition: Condition
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let humidity: Int
    let cloud: Int
    let feelslike_c: Double
    let feelslike_f: Double
    let vis_km: Double
    let vis_miles: Double
    let uv: Int
    let gust_mph: Double
    let gust_kph: Double
}

struct Condition{
    let text: String
    let icon: String
    let code: Int
}

struct Forecast{
    let forecastDays: Array<ForecastDay>
}

struct ForecastDay{
    let date: String
    let day: DayWeather
}

struct DayWeather{
    let avgtemp_c: Double
    let avgtemp_f: Double
    let condition: Condition
}



