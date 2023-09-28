//
//  WeatherData.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation

enum WeatherData {
    struct Entity: Codable {
        let location: Location
        let weather: CurrentWeather
        let forecast: Forecast
        
        enum CodingKeys: String, CodingKey {
            case location
            case weather = "current"
            case forecast
        }
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<WeatherData.Entity.CodingKeys> = try decoder.container(keyedBy: WeatherData.Entity.CodingKeys.self)
            self.location = try container.decode(WeatherData.Location.self, forKey: WeatherData.Entity.CodingKeys.location)
            self.weather = try container.decode(WeatherData.CurrentWeather.self, forKey: WeatherData.Entity.CodingKeys.weather)
            self.forecast = try container.decode(WeatherData.Forecast.self, forKey: WeatherData.Entity.CodingKeys.forecast)
        }
    }
    
    struct Location: Codable {
        let name: String
        let region: String
        let country: String
        let lat: Float
        let lon: Float
        let tz_id: String
        let localtime_epoch: Double
        let localtime: String
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<WeatherData.Location.CodingKeys> = try decoder.container(keyedBy: WeatherData.Location.CodingKeys.self)
            self.name = try container.decode(String.self, forKey: WeatherData.Location.CodingKeys.name)
            self.region = try container.decode(String.self, forKey: WeatherData.Location.CodingKeys.region)
            self.country = try container.decode(String.self, forKey: WeatherData.Location.CodingKeys.country)
            self.lat = try container.decode(Float.self, forKey: WeatherData.Location.CodingKeys.lat)
            self.lon = try container.decode(Float.self, forKey: WeatherData.Location.CodingKeys.lon)
            self.tz_id = try container.decode(String.self, forKey: WeatherData.Location.CodingKeys.tz_id)
            self.localtime_epoch = try container.decode(Double.self, forKey: WeatherData.Location.CodingKeys.localtime_epoch)
            self.localtime = try container.decode(String.self, forKey: WeatherData.Location.CodingKeys.localtime)
        }
    }
    
    struct CurrentWeather: Codable {
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
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<WeatherData.CurrentWeather.CodingKeys> = try decoder.container(keyedBy: WeatherData.CurrentWeather.CodingKeys.self)
            self.last_updated_epoch = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.last_updated_epoch)
            self.last_updated = try container.decode(String.self, forKey: WeatherData.CurrentWeather.CodingKeys.last_updated)
            self.temp_c = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.temp_c)
            self.temp_f = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.temp_f)
            self.is_day = try container.decode(Int.self, forKey: WeatherData.CurrentWeather.CodingKeys.is_day)
            self.condition = try container.decode(WeatherData.Condition.self, forKey: WeatherData.CurrentWeather.CodingKeys.condition)
            self.wind_mph = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.wind_mph)
            self.wind_kph = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.wind_kph)
            self.wind_degree = try container.decode(Int.self, forKey: WeatherData.CurrentWeather.CodingKeys.wind_degree)
            self.wind_dir = try container.decode(String.self, forKey: WeatherData.CurrentWeather.CodingKeys.wind_dir)
            self.pressure_mb = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.pressure_mb)
            self.pressure_in = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.pressure_in)
            self.precip_mm = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.precip_mm)
            self.precip_in = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.precip_in)
            self.humidity = try container.decode(Int.self, forKey: WeatherData.CurrentWeather.CodingKeys.humidity)
            self.cloud = try container.decode(Int.self, forKey: WeatherData.CurrentWeather.CodingKeys.cloud)
            self.feelslike_c = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.feelslike_c)
            self.feelslike_f = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.feelslike_f)
            self.vis_km = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.vis_km)
            self.vis_miles = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.vis_miles)
            self.uv = try container.decode(Int.self, forKey: WeatherData.CurrentWeather.CodingKeys.uv)
            self.gust_mph = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.gust_mph)
            self.gust_kph = try container.decode(Double.self, forKey: WeatherData.CurrentWeather.CodingKeys.gust_kph)
        }
    }
    
    struct Condition: Codable, Hashable {
        let text: String
        let icon: String
        let code: Int
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<WeatherData.Condition.CodingKeys> = try decoder.container(keyedBy: WeatherData.Condition.CodingKeys.self)
            self.text = try container.decode(String.self, forKey: WeatherData.Condition.CodingKeys.text)
            self.icon = try container.decode(String.self, forKey: WeatherData.Condition.CodingKeys.icon)
            self.code = try container.decode(Int.self, forKey: WeatherData.Condition.CodingKeys.code)
        }
    }
    
    struct Forecast: Codable, Hashable {
        static func == (lhs: WeatherData.Forecast, rhs: WeatherData.Forecast) -> Bool {
            return lhs.forecastDays == rhs.forecastDays
        }
        enum CodingKeys: String, CodingKey {
            case forecastDays = "forecastday"
        }
        let forecastDays: Array<ForecastDay>
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<WeatherData.Forecast.CodingKeys> = try decoder.container(keyedBy: WeatherData.Forecast.CodingKeys.self)
            self.forecastDays = try container.decode([WeatherData.ForecastDay].self, forKey: WeatherData.Forecast.CodingKeys.forecastDays)
        }
    }
    
    struct ForecastDay: Codable, Hashable {
        static func == (lhs: WeatherData.ForecastDay, rhs: WeatherData.ForecastDay) -> Bool {
            return lhs.date == rhs.date
        }
        
        let date: String
        let day: DayWeather
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<WeatherData.ForecastDay.CodingKeys> = try decoder.container(keyedBy: WeatherData.ForecastDay.CodingKeys.self)
            self.date = try container.decode(String.self, forKey: WeatherData.ForecastDay.CodingKeys.date)
            self.day = try container.decode(WeatherData.DayWeather.self, forKey: WeatherData.ForecastDay.CodingKeys.day)
        }
    }
    
    struct DayWeather: Codable, Hashable {
        static func == (lhs: WeatherData.DayWeather, rhs: WeatherData.DayWeather) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }
        
        let avgtemp_c: Double
        let avgtemp_f: Double
        let condition: Condition
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<WeatherData.DayWeather.CodingKeys> = try decoder.container(keyedBy: WeatherData.DayWeather.CodingKeys.self)
            self.avgtemp_c = try container.decode(Double.self, forKey: WeatherData.DayWeather.CodingKeys.avgtemp_c)
            self.avgtemp_f = try container.decode(Double.self, forKey: WeatherData.DayWeather.CodingKeys.avgtemp_f)
            self.condition = try container.decode(WeatherData.Condition.self, forKey: WeatherData.DayWeather.CodingKeys.condition)
        }
    }
}
