//
// Created by Anver Bogatov on 29.12.2017.
// Copyright (c) 2017 Anver Bogatov. All rights reserved.
//

import XCTest
@testable import OpenWeatherMapKit

class NopConverterTests: XCTestCase {

    private var converter: NopConverter?

    override func setUp() {
        super.setUp()
        converter = NopConverter()
    }

    func test_convertFails() {
        XCTAssertNil(converter!.convert(entity: Data()))
    }

}
