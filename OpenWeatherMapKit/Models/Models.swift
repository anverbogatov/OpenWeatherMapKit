//
//  Models.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 22.12.2017.
//  Copyright © 2017 Anver Bogatov. All rights reserved.
//

import Foundation

protocol BasicItem {

}

public struct WeatherItem: BasicItem {

    /// Weather item's temperature values in Kelvin
    public let kelvin: (currentTemp: Double, maxTemp: Double, minTemp: Double)
    /// Weather item's temperature values in Celsius
    public let celsius: (currentTemp: Double, maxTemp: Double, minTemp: Double)
    /// Weather item's temperature values in Fahrenheit
    public let fahrenheit: (currentTemp: Double, maxTemp: Double, minTemp: Double)

    init(currentTemp: Double,
         maxTemp: Double,
         minTemp: Double) {
        kelvin = (currentTemp, maxTemp, minTemp)
        // TODO: probably this is not the best place for any sort of convert / calculation logic. Move it to special service
        celsius = (toCelsius(kelvin: currentTemp), toCelsius(kelvin: maxTemp), toCelsius(kelvin: minTemp))
        fahrenheit = (toFahrenheit(celsius: celsius.currentTemp), toFahrenheit(celsius: celsius.maxTemp), toFahrenheit(celsius: celsius.minTemp))
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
