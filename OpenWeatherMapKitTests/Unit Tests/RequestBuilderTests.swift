//
//  RequestBuilderTests.swift
//  OpenWeatherMapKitTests
//
//  Created by Anver Bogatov on 28.12.2017.
//  Copyright © 2017 Anver Bogatov. All rights reserved.
//

import XCTest
@testable import OpenWeatherMapKit

class RequestBuilderTests: XCTestCase {

    private let city = "Samara"
    private let countryCode = "ru"
    private let token = "abcdefg123456"
    private let latitude = 3.14
    private let longitude = -3.14

    func test_requestBuildWithCityName() {

        let url = RequestBuilder()
            .setCity(city: city)
            .build()

        XCTAssertNotNil(url)
        XCTAssertEqual(url, "\(Constants.Endpoints.kOpenWeatherMapApiEndPoint)/weather?q=\(city)")
    }

    func test_requestBuildWithCityNameAndCountry() {

        let url = RequestBuilder()
            .setCity(city: city)
            .setCountryCode(code: countryCode)
            .build()

        XCTAssertNotNil(url)
        XCTAssertEqual(url, "\(Constants.Endpoints.kOpenWeatherMapApiEndPoint)/weather?q=\(city),\(countryCode)")
    }

    func test_requestBuildWithCityNameAndCountryAndToken() {

        let url = RequestBuilder()
            .setCity(city: city)
            .setCountryCode(code: countryCode)
            .setToken(token: token)
            .build()

        XCTAssertNotNil(url)
        XCTAssertEqual(url, "\(Constants.Endpoints.kOpenWeatherMapApiEndPoint)/weather?q=\(city),\(countryCode)&appid=\(token)")
    }

    func test_requestBuildWithCoordinates() {

        let url = RequestBuilder()
            .setLatitude(lat: latitude)
            .setLongitude(lon: longitude)
            .build()

        XCTAssertNotNil(url)
        XCTAssertEqual(url, "\(Constants.Endpoints.kOpenWeatherMapApiEndPoint)/weather?lat=\(latitude)&lon=\(longitude)")
    }

    func test_requestBuildWithCoordinatesAndToken() {

        let url = RequestBuilder()
            .setLatitude(lat: latitude)
            .setLongitude(lon: longitude)
            .setToken(token: token)
            .build()

        XCTAssertNotNil(url)
        XCTAssertEqual(url, "\(Constants.Endpoints.kOpenWeatherMapApiEndPoint)/weather?lat=\(latitude)&lon=\(longitude)&appid=\(token)")
    }

}
