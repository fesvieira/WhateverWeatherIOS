//
//  NextDayChip.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 27/09/23.
//

import SwiftUI

struct NextDayChip: View {
    var forecastDay: WeatherData.ForecastDay
    var isCelsius: Bool
    
    private var dateFormatter = DateFormatter()
    private var date: String = ""
    private var temp: String {
        return String(isCelsius ? forecastDay.day.avgtemp_c : forecastDay.day.avgtemp_f)
    }
    
    init(forecastDay: WeatherData.ForecastDay, isCelsius: Bool) {
        self.forecastDay = forecastDay
        self.isCelsius = isCelsius
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = .autoupdatingCurrent
        if let newDate = dateFormatter.date(from: forecastDay.date) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "MM/dd"
            date = newDateFormatter.string(from: newDate)
        }
    }
    
    var body: some View {
        VStack(spacing: 32) {
            Text(date)
                .foregroundStyle(.white)
                .font(.title3)
            
            AsyncImage(url: URL(string: "https:\(forecastDay.day.condition.icon)"))
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
            
            Text(temp)
                .foregroundStyle(.white)
                .font(.title3)
        }
        .padding()
        .background(.AppDarkBlue)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
        .frame(maxWidth: 100)
    }
}
