//
//  WeatherDataAddons.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation
import SwiftUI

extension WeatherData.Entity? {
    var weatherGradient: Array<Color>  {
        guard let code = self?.weather.condition.code else {
            return [.AppDarkBlue, .AppDarkBlue]
        }
        
        switch code {
        case 1000:
            return self?.weather.is_day == 0 ? [.NightGradientTop, .NightGradientBottom] : [.SunnyGradientTop, .SunnyGradientBottom]
            
        case 1001...1282:
            return [.CloudGradientTop, .CloudGradientBottom]
            
        default:
            return [.AppDarkBlue, .AppDarkBlue]
        }
    }
    
    var weatherLottie: String {
        guard let code = self?.weather.condition.code else {
            return LottieAsset.loading.name
        }
        
        switch code {
        case 1000:
            return self?.weather.is_day == 0 ? LottieAsset.clearNight.name : LottieAsset.sunny.name
            
        case 1001...1282:
            return LottieAsset.someClouds.name
            
        default:
            return LottieAsset.loading.name
        }
    }
}
