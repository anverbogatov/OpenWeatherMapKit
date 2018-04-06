//
//  FiveDaysWeatherForecastItem.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 05/04/2018.
//  Copyright © 2018 Anver Bogatov. All rights reserved.
//

import Foundation

public struct FiveDaysForecast : Codable {
    public var list: [ForecastItem]
}

public struct ForecastItem : Codable {
    public var dt_txt: String
    public var dt: TimeInterval
    public var main: WeatherItem2
    public var weather: [WeatherDescriptor]
    public var wind: Wind
}

public struct WeatherItem2 : Codable {
    public var temp: Float
    public var temp_min: Float
    public var temp_max: Float
    public var pressure: Float
    public var humidity: Int
}
public struct WeatherDescriptor : Codable {
    public var main: String
    public var description: String
}
public struct Wind : Codable {
    public var speed: Float
    public var deg: Float
}
