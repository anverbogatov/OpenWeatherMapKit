//
//  EntityConverters.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 29.12.2017.
//  Copyright © 2017 Anver Bogatov. All rights reserved.
//

import Foundation

internal enum SupportedType {
    case weatherForceast, weatherItem
}

internal protocol EntityConverter {

    func convert(entity: Data) -> BasicItem?

}

internal class WeatherItemConverter: EntityConverter {

    func convert(entity: Data) -> BasicItem? {

        let jsonData = try? JSONSerialization.jsonObject(with: entity, options: .mutableContainers) as! NSDictionary
        var result: WeatherItem?

        if let jsonData = jsonData {
            let weatherStats = jsonData["main"] as! NSDictionary
            let t = weatherStats["temp"] as! Double
            let tMax = weatherStats["temp_max"] as! Double
            let tMin = weatherStats["temp_min"] as! Double
            result = WeatherItem(currentTemp: t,
                    maxTemp: tMax,
                    minTemp: tMin)
        }

        return result
    }

}

internal final class NopConverter: EntityConverter {

    func convert(entity: Data) -> BasicItem? {
        return nil
    }

}

internal final class EntityConverterFactory {

    class func makeConverter(for type: SupportedType) -> EntityConverter {
        switch type {
        case .weatherItem:
            return WeatherItemConverter()
        default:
            return NopConverter()
        }
    }

}
