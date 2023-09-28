//
//  NextDayChip.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 27/09/23.
//

import SwiftUI

struct NextDayChip: View {
    var forecastDay: WeatherData.ForecastDay
    
    var body: some View {
        VStack {
            Text(forecastDay.date)
                .foregroundStyle(.white)
                .font(.title2)
            
            AsyncImage(url: URL(string: "https:\(forecastDay.day.condition.icon)"))
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
            
            Text(String(forecastDay.day.avgtemp_c))
                .foregroundStyle(.white)
                .font(.title2)
        }
        .padding()
        .background(.AppDarkBlue)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 60, height: 60)))
        
    }
}
