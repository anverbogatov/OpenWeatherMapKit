//
//  OpenWeatherMapKit.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 22.12.2017.
//  Copyright © 2017 Anver Bogatov. All rights reserved.
//

import Foundation

class OpenWeatherMapKit {

    /// API token that should be set during initialization
    private static var token: String?

    /// Main kit's instance.
    static let instance = OpenWeatherMapKit()

    /// Private initializer. Must not be invoked from outside
    private init() {}

    /// Initialize main framework class with OpenWeatherMap service's API token.
    ///
    /// - Parameter token: API key that should be retrieved from https://openweathermap.org
    class func initialize(withAppId token: String) {
        self.token = token
    }

    /// Request current weather for provided geographical coordinate.
    ///
    /// - Parameters:
    ///   - coord: geo coordinate as a tuple with $0=latitude and $1=longitude
    ///   - callback: closure that will be invoked as the result of API call
    func currentWeather(forCoordiante coord: (latitude: Double, longitude: Double),
                        callback: @escaping (WeatherItem?, Error?) -> ()) {
        requestWeather(from:
            RequestBuilder()
                .setToken(token: OpenWeatherMapKit.token)
                .setWeatherMode(mode: .current)
                .setLatitude(lat: coord.latitude)
                .setLongitude(lon: coord.longitude)
                .build(),
                       callback: callback)
    }

    /// Request current weather for provided city (by name and [optional] country code).
    ///
    /// - Parameters:
    ///   - city: name of the city
    ///   - countryCode: optional geo code of the country
    ///   - callback: closure that will be invoked as the result of API call
    func currentWeather(forCity city: String,
                        withCountryCode countryCode: String? = nil,
                        callback: @escaping (WeatherItem?, Error?) -> ()) {
        requestWeather(from:
            RequestBuilder()
                .setToken(token: OpenWeatherMapKit.token)
                .setWeatherMode(mode: .current)
                .setCity(city: city)
                .setCountryCode(code: countryCode)
                .build(),
                       callback: callback)
    }

    private func requestWeather(from url: String,
                                callback: @escaping (WeatherItem?, Error?) -> ()) {
        // TODO: fix force unwrap here
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if let error = error {
                callback(nil, error)
            }
            guard let data = data, let response = response else { return }
            let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
            if let jsonData = jsonData {
                let weatherStats = jsonData["main"] as! NSDictionary
                let t = weatherStats["temp"] as! Double
                let tMax = weatherStats["temp_max"] as! Double
                let tMin = weatherStats["temp_min"] as! Double
                callback(WeatherItem(currentTemp: t,
                                     maxTemp: tMax,
                                     minTemp: tMin), nil)
            }
            }.resume()
    }

}