//
//  Colors.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 27/09/23.
//

import Foundation
import SwiftUI

extension Color {
    static var raisinBlack = Color(uiColor: .raisinBlack)
    static var AppDarkBlue = Color(uiColor: .AppDarkBlue)
    static var MidnightBlue = Color(uiColor: .MidnightBlue)
    static var Gray = Color(uiColor: .Gray)
    static var SunnyGradientTop = Color(uiColor: .SunnyGradientTop)
    static var SunnyGradientBottom = Color(uiColor: .SunnyGradientBottom)
    static var NightGradientTop = Color(uiColor: .NightGradientTop)
    static var NightGradientBottom = Color(uiColor: .NightGradientBottom)
    static var CloudGradientTop = Color(uiColor: .CloudGradientTop)
    static var CloudGradientBottom = Color(uiColor: .CloudGradientBottom)
}

extension UIColor {
    static var raisinBlack = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    static var AppDarkBlue = UIColor(red: 0.11, green: 0.12, blue: 0.21, alpha: 1.00)
    static var MidnightBlue = UIColor(red: 0.08, green: 0.09, blue: 0.15, alpha: 1.00)
    static var Gray = UIColor(red: 0.92, green: 0.92, blue: 0.96, alpha: 1.00)
    static var SunnyGradientTop = UIColor(red: 0.28, green: 0.47, blue: 0.67, alpha: 1.00)
    static var SunnyGradientBottom = UIColor(red: 0.40, green: 0.63, blue: 0.86, alpha: 1.00)
    static var NightGradientTop = UIColor(red: 0.10, green: 0.10, blue: 0.20, alpha: 1.00)
    static var NightGradientBottom = UIColor(red: 0.19, green: 0.26, blue: 0.38, alpha: 1.00)
    static var CloudGradientTop = UIColor(red: 0.38, green: 0.42, blue: 0.48, alpha: 1.00)
    static var CloudGradientBottom = UIColor(red: 0.23, green: 0.26, blue: 0.29, alpha: 1.00)
}

extension ShapeStyle where Self == Color {
    static var raisinBlack: Color { .raisinBlack }
    static var MidnightBlue: Color { .MidnightBlue }
    static var Gray: Color { .Gray }
    static var SunnyGradientTop: Color { .SunnyGradientTop }
    static var SunnyGradientBottom: Color { .SunnyGradientBottom }
    static var NightGradientTop: Color { .NightGradientTop }
    static var NightGradientBottom: Color { .NightGradientBottom }
    static var CloudGradientTop: Color { .CloudGradientTop }
    static var CloudGradientBottom: Color { .CloudGradientBottom }
    static var AppDarkBlue: Color { .AppDarkBlue }
}



