//
//  ContentView.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 26/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
            
    var body: some View {
        ZStack {
            if (viewModel.weatherData != nil && !viewModel.isFetchingData) {
                weatherDataUi
            } else if (viewModel.isFetchingData) {
                loadingUi
            } else {
                notFoundUi
            }
            
            if (!viewModel.isFetchingData) {
                FormsTextField(
                    text: viewModel.currentCityBinding(),
                    placeholder: "Type a city",
                    rightView: AnyView(searchButton)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            LinearGradient(gradient: Gradient(colors: viewModel.weatherData.weatherGradient), startPoint: .top, endPoint: .bottom)
        )
    }
    
    var searchButton: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .foregroundStyle(.white)
            .frame(width: 24, height: 24)
            .onTapGesture {
                viewModel.getWeather()
            }
    }
    
    var notFoundUi: some View {
        VStack {
            Text("Location not found")
                .foregroundStyle(.white.opacity(0.8))
                .font(.title)
        }
    }
    
    var loadingUi: some View {
        VStack {
            LottieView(
                name: LottieAsset.loading.name,
                loopMode: .loop,
                speed: 1.0
            )
            .frame(width: 180, height: 180)
            
            Text("Powered by WeatherAPI.com")
                .font(.title2)
                .foregroundStyle(.white)
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
    
    var weatherDataUi: some View {
        ScrollView {
            VStack {
                Text(viewModel.unit)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.AppDarkBlue)
                    .clipShape(Circle())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                LottieView(
                    name: viewModel.weatherData.weatherLottie,
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
    }
}

struct Preview: View {
    var body: some View {
        VStack {
            LottieView(
                name: LottieAsset.loading.name,
                loopMode: .loop,
                speed: 1.0
            )
            .frame(width: 180, height: 180)
            
            Text("Powered by WeatherAPI.com")
                .font(.title2)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(.AppDarkBlue)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    Preview()
}
