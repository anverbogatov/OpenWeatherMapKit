//
//  RequestBuilder.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 26.12.2017.
//  Copyright © 2017 Anver Bogatov. All rights reserved.
//

import Foundation

enum WeatherMode {
    case current
}

// TODO: add parameters validation

internal class RequestBuilder {

    private var token: String?
    private var serviceUrl: String
    private var weatherMode: WeatherMode
    private var latitude: Double?
    private var longitude: Double?
    private var city: String?
    private var countryCode: String?

    init() {
        self.serviceUrl = Constants.Endpoints.kOpenWeatherMapApiEndPoint
        self.weatherMode = .current
    }

    func setWeatherMode(mode: WeatherMode) -> RequestBuilder {
        self.weatherMode = mode
        return self
    }

    func setLatitude(lat: Double) -> RequestBuilder {
        self.latitude = lat
        return self
    }

    func setLongitude(lon: Double) -> RequestBuilder {
        self.longitude = lon
        return self
    }

    func setCity(city: String) -> RequestBuilder {
        self.city = city
        return self
    }

    func setCountryCode(code: String?) -> RequestBuilder {
        self.countryCode = code
        return self
    }

    func setToken(token: String?) -> RequestBuilder {
        self.token = token
        return self
    }

    func build() -> String {

        // TODO: add configuration validation
        // TODO: cover by unit test

        if weatherMode == .current {
            serviceUrl += "/weather?"
        }

        if let city = city {
            serviceUrl += "q=\(city)"
            if let code = countryCode {
                serviceUrl += ",\(code)"
            }
        }

        if let latitude = latitude {
            serviceUrl += "lat=\(latitude)"
        }

        if let longitude = longitude {
            serviceUrl += "&lon=\(longitude)"
        }

        if let token = token {
            serviceUrl += "&appid=\(token)"
        }

        #if DEBUG
            print("Generated url: '\(serviceUrl)'")
        #endif
        return serviceUrl
    }
}
