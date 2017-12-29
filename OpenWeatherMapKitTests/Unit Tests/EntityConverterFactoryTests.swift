//
// Created by Anver Bogatov on 29.12.2017.
// Copyright (c) 2017 Anver Bogatov. All rights reserved.
//

import XCTest
@testable import OpenWeatherMapKit

class EntityConverterFactoryTests: XCTestCase {

    func test_factoryReturnsNop() {
        let converter = EntityConverterFactory.makeConverter(for: .weatherForceast)
        XCTAssertNotNil(converter)
        XCTAssertTrue(type(of: converter) == NopConverter.self)
    }

    func test_factoryReturnsWeatherItemConverter() {
        let converter = EntityConverterFactory.makeConverter(for: .weatherItem)
        XCTAssertNotNil(converter)
        XCTAssertTrue(type(of: converter) == WeatherItemConverter.self)
    }
}
