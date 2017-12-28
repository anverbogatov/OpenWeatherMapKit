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

}
