//
//  NetworkManager.swift
//  OpenWeatherMapKit
//
//  Created by Anver Bogatov on 29.12.2017.
//  Copyright © 2017 Anver Bogatov. All rights reserved.
//

import Foundation

internal final class NetworkManager {

    internal static let instance = NetworkManager()

    private init() {
    }

    // TODO: network manager knows about WeatherItems? bad... refactor that!
    internal func get(from url: String,
                      callback: @escaping (WeatherItem?, Error?) -> ()) {
        // TODO: fix force unwrap here
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if let error = error {
                callback(nil, error)
            }
            guard let data = data else {
                return
            }

            let weatherItem = EntityConverterFactory.makeConverter(for: .weatherItem).convert(entity: data)

            guard let item = weatherItem as? WeatherItem else {
                return
            }

            callback(item, nil)

        }.resume()
    }
}
