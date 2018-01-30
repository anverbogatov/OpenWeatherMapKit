//
//  Functions.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 30.01.2018.
//  Copyright © 2018 Anver Bogatov. All rights reserved.
//

import Foundation

internal let kKelvinZeroInCelsius = 273.15
internal let kFahrenheitZeroInKelvin = -459.67

func toCelsius(kelvin: Double) -> Double {
    return kelvin - kKelvinZeroInCelsius
}

func toFahrenheit(celsius: Double) -> Double {
    return celsius * 9 / 5 + 32
}
