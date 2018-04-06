//
//  WeatherModeEnum.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 06/04/2018.
//  Copyright © 2018 Anver Bogatov. All rights reserved.
//

import Foundation

/// Weather mode for which forecast must be retrieved.
///
/// - current: current weather data
/// - fiveDays: forecast for next 5 days
enum WeatherMode {
    case current
    case fiveDays
}
