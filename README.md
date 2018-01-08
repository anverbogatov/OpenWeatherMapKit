[![Build Status](https://travis-ci.org/anverbogatov/OpenWeatherMapKit.svg?branch=master)](https://travis-ci.org/anverbogatov/OpenWeatherMapKit)
[![codecov](https://codecov.io/gh/anverbogatov/OpenWeatherMapKit/branch/master/graph/badge.svg)](https://codecov.io/gh/anverbogatov/OpenWeatherMapKit)
[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/OpenWeatherMapKit/badge.png)](https://cocoadocs.org/docsets/OpenWeatherMapKit)
||
[![Swift](https://img.shields.io/badge/swift-4.0-orange.svg)](https://img.shields.io/badge/swift-4.0-orange.svg)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/OpenWeatherMapKit/badge.svg)](https://cocoadocs.org/docsets/OpenWeatherMapKit)

# OpenWeatherMapKit
OpenWeatherMapKit is a small and simple framework written in Swift that gives you access to all features of the OpenWeatherMap service's APIs right in your iOS / macOS / watchOS/ tvOS application.

## How to install:

#### Cocoapods
Just add following line to your Podfile:
```ruby
pod 'OpenWeatherMapKit'
```
and run following command in your Terminal from project's root folder:
```shell
pod update
```

## How to use:

#### Prerequisites
To normal working OpenWeatherMapKit must be initialized with your API token.

You can use following method to initialize OpenWeatherMapKit. Just replace `[YOUR API TOKEN]` by your own API token which can be retrieved from https://home.openweathermap.org/api_keys:
```swift
 OpenWeatherMapKit.initialize(withAppId: "[YOUR API TOKEN]")
```

#### Usage
Use `OpenWeatherMapKit` class to retrieve weather data. It is a singleton and access to it's instance can be done through `instance` variable.

##### 🌇 Get weather by City
You can retrieve weather data for specific city by it's name:
```swift
OpenWeatherMapKit.instance.currentWeather(forCity: "Samara") { (weatherItem, error) in
    ...
}
```
or event by city name and country code:
```swift
OpenWeatherMapKit.instance.currentWeather(forCity: "Samara", withCountryCode: "ru") { (weatherItem, error) in
    ...
}
```

##### 🌍 Get weather by geo coordinates
You can retrieve weather data for specific geo location by it's coordinates:
```swift
OpenWeatherMapKit.instance.currentWeather(forCoordiante: (latitude: 53.2610313, longitude: 50.0579958)) { (weatherItem, error) in
    ...
}
```

##### 🌤 WeatherItem
All operations for getting current weather data return special object of `WeatherItem` type. `WeatherItem` is a simple struct that contains temperature data on the board. Here are fields you can access on it:
```swift
let currentTemp: Double
let maxTemp: Double
let minTemp: Double
```
⚠️ Temperature data provided in Kelvin. It is the only option available at the moment, but this will be changed in the future.
