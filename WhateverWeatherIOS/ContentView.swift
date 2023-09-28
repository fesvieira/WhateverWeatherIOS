//
//  ContentView.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 26/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var searchButton: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .foregroundStyle(.white)
            .frame(width: 24, height: 24)
            .onTapGesture {
                viewModel.getWeather()
            }
    }

    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text(viewModel.unit)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.AppDarkBlue)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    LottieView(
                        name: LottieAsset.sunny.name,
                        loopMode: .loop,
                        speed: 0.5
                    )
                        .frame(width: 180, height: 180)
                    
                    Text(viewModel.currentCity)
                        .foregroundStyle(.white)
                        .font(.title2)
                    
                    Text(String(viewModel.weatherData?.weather.temp_c ?? 0.0))
                        .foregroundStyle(.white)
                        .font(.custom("system", size: 120))
                    
                    Text(viewModel.weatherData?.weather.condition.text ?? "")
                        .foregroundStyle(.white)
                        .font(.title2)
                    
                    HStack {
                        ForEach(viewModel.weatherData?.forecast.forecastDays ?? [], id: \.self) { forecastDay in
                            NextDayChip(forecastDay: forecastDay)
                        }
                    }
                }
                .padding()
            }
            .padding(.bottom, 90)
            
            FormsTextField(
                text: viewModel.currentCityBinding(),
                placeholder: "Type a city",
                rightView: AnyView(searchButton)
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.SunnyGradientTop)
    }
}
