//
//  WeatherItem.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 06/04/2018.
//  Copyright © 2018 Anver Bogatov. All rights reserved.
//

import Foundation

public struct WeatherItem : Codable {

    /// Weather item's temperature values in Kelvin
    public var kelvin: (currentTemp: Double, maxTemp: Double, minTemp: Double) {
        get {
            return (temp, temp_max, temp_min)
        }
    }

    /// Weather item's temperature values in Celsius
    public var celsius: (currentTemp: Double, maxTemp: Double, minTemp: Double) {
        get {
            return (toCelsius(kelvin: temp), toCelsius(kelvin: temp_max), toCelsius(kelvin: temp_min))
        }
    }

    /// Weather item's temperature values in Fahrenheit
    public var fahrenheit: (currentTemp: Double, maxTemp: Double, minTemp: Double) {
        get {
            return (toFahrenheit(celsius: celsius.currentTemp), toFahrenheit(celsius: celsius.maxTemp), toFahrenheit(celsius: celsius.minTemp))
        }
    }

    public var pressure: Double
    public var humidity: Int
    
    var temp: Double
    var temp_min: Double
    var temp_max: Double

    init(currentTemp: Double, maxTemp: Double, minTemp: Double) {
        self.temp = currentTemp
        self.temp_max = maxTemp
        self.temp_min = minTemp

        self.pressure = 0.0
        self.humidity = 0
    }

    enum CodingKeys : String, CodingKey {
        case temp = "temp"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}

extension WeatherItem: CustomStringConvertible {

    public var description: String {
        return """
        WeatherItem(
        K: current=\(self.kelvin.currentTemp), max=\(self.kelvin.maxTemp), min=\(self.kelvin.minTemp),
        °С: current=\(self.celsius.currentTemp), max=\(self.celsius.maxTemp), min=\(self.celsius.minTemp),
        °F: current=\(self.fahrenheit.currentTemp), max=\(self.fahrenheit.maxTemp), min=\(self.fahrenheit.minTemp)
        )
        """
    }

}
