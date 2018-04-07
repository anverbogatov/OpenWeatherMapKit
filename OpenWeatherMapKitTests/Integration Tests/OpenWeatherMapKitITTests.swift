//
//  OpenWeatherMapKitTests.swift
//  OpenWeatherMapKitTests
//
//  Created by Anver Bogatov on 22.12.2017.
//  Copyright © 2017 Anver Bogatov. All rights reserved.
//

import XCTest
@testable import OpenWeatherMapKit

/// Integration tests of kit's main class
class OpenWeatherMapKitITTests: XCTestCase {

    override func setUp() {
        OpenWeatherMapKit.initialize(withAppId: "eec2dfbd18617aa7c7c2654b184f560d")
    }
    
    func test_currentWeather_forCity() {
        var result: ForecastItem?
        var caughtError: Error?
        let ex = expectation(description: "OpenWeatherMapKit should provide current weather for city")

        OpenWeatherMapKit.instance.currentWeather(forCity: "Samara") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_currentWeather_forCityWithCountryCode() {
        var result: ForecastItem?
        var caughtError: Error?
        let ex = expectation(description: "OpenWeatherMapKit should provide current weather for city with country code")

        OpenWeatherMapKit.instance.currentWeather(forCity: "Samara", withCountryCode: "ru") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_currentWeather_forGeoCoordinate() {
        var result: ForecastItem?
        var caughtError: Error?
        let ex = expectation(description: "OpenWeatherMapKit should provide current weather for geo location")

        OpenWeatherMapKit.instance.currentWeather(forCoordiante: (latitude: 53.2610313, longitude: 50.0579958)) { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_5_days_weather_forCity() {
        var result: ForecastItemsList?
        var caughtError: Error?

        let ex = expectation(description: "5 days weather forecast")

        OpenWeatherMapKit.instance.weatherForecastForFiveDays(forCity: "Samara") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_5_days_weather_forCity_and_countryCode() {
        var result: ForecastItemsList?
        var caughtError: Error?

        let ex = expectation(description: "5 days weather forecast")

        OpenWeatherMapKit.instance.weatherForecastForFiveDays(forCity: "Samara", withCountryCode: "ru") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_5_days_weather_forGeoCoordinate() {
        var result: ForecastItemsList?
        var caughtError: Error?

        let ex = expectation(description: "5 days weather forecast")

        OpenWeatherMapKit.instance.weatherForecastForFiveDays(forCoordiante: (latitude: 53.2610313, longitude: 50.0579958)) { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

}
