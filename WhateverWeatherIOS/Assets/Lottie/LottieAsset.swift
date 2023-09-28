//
//  LottieAsset.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 28/09/23.
//

import Foundation

enum LottieAsset: String {
    case loading
    case clearNight
    case rain
    case rainy
    case someClouds
    case sunny
    
    var name: String {
        switch self {
        case .loading:
            return "loading"
        case .clearNight:
            return "clear_night"
        case .rain:
            return "rain"
        case .rainy:
            return "rainy"
        case .someClouds:
            return "some_clouds"
        case .sunny:
            return "sunny"
        }
    }
}
