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

    internal func get<T : Codable>(from url: String,
                                   callback: @escaping (T?, Error?) -> ()) {
        guard let serviceUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: serviceUrl) { (data, response, error) in
            if let error = error {
                callback(nil, error)
            }
            guard let data = data else { return }

            let decoder = JSONDecoder() // TODO: move decoding to othe place (dispatcher, for example)
            do {
                let result = try decoder.decode(T.self, from: data)
                callback(result, nil)
            } catch {
                callback(nil, error)
            }
            }.resume()
    }
}
