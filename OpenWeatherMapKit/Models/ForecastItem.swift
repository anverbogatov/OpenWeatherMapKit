//
//  ForecastItem.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 06/04/2018.
//  Copyright © 2018 Anver Bogatov. All rights reserved.
//

import Foundation

public struct ForecastItem : Codable {
    public var dt_txt: String?
    public var dt: TimeInterval
    public var main: WeatherItem
    public var weather: [WeatherDescriptor]
    public var wind: Wind
}
