//
//  OpenWeatherMapKitTests.swift
//  OpenWeatherMapKitTests
//
//  Created by Anver Bogatov on 22.12.2017.
//  Copyright © 2017 Anver Bogatov. All rights reserved.
//

import XCTest
@testable import OpenWeatherMapKit

class OpenWeatherMapKitTests: XCTestCase {

    override func setUp() {
        OpenWeatherMapKit.initialize(withAppId: "eec2dfbd18617aa7c7c2654b184f560d")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_currentWeather_forCity() {
        var result: WeatherItem?
        var caughtError: Error?

        let group = DispatchGroup()
        group.enter()

        OpenWeatherMapKit.instance.currentWeather(forCity: "Samara") { (weatherItem, error) in
            //        OpenWeatherMapKit.instance.currentWeather(forCity: "Samara", withCountryCode: "ru") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            group.leave()
        }

        group.wait()

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_currentWeather_forCityWithCountryCode() {
        var result: WeatherItem?
        var caughtError: Error?

        let group = DispatchGroup()
        group.enter()

        OpenWeatherMapKit.instance.currentWeather(forCity: "Samara", withCountryCode: "ru") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            group.leave()
        }

        group.wait()

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_currentWeather_forGeoCoordinate() {
        var result: WeatherItem?
        var caughtError: Error?

        let group = DispatchGroup()
        group.enter()

        OpenWeatherMapKit.instance.currentWeather(forCoordiante: (latitude: 53.2610313, longitude: 50.0579958)) { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            group.leave()
        }

        group.wait()

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
