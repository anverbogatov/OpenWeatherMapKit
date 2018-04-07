[![Build Status](https://travis-ci.org/anverbogatov/OpenWeatherMapKit.svg?branch=master)](https://travis-ci.org/anverbogatov/OpenWeatherMapKit)
[![codecov](https://codecov.io/gh/anverbogatov/OpenWeatherMapKit/branch/master/graph/badge.svg)](https://codecov.io/gh/anverbogatov/OpenWeatherMapKit)
[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/OpenWeatherMapKit/badge.png)](https://cocoadocs.org/docsets/OpenWeatherMapKit)
||
[![Swift](https://img.shields.io/badge/swift-4.0-orange.svg)](https://img.shields.io/badge/swift-4.0-orange.svg)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/OpenWeatherMapKit/badge.svg)](https://cocoadocs.org/docsets/OpenWeatherMapKit)

# OpenWeatherMapKit
OpenWeatherMapKit is a small and simple framework written in Swift that gives you access to all features of the OpenWeatherMap service's APIs right in your iOS / macOS / watchOS/ tvOS application.

## How to install:

#### 🥥 Cocoapods
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
OpenWeatherMapKit.instance.currentWeather(forCity: "Samara") { (forecast, error) in
    ...
}
```
or event by city name and country code:
```swift
OpenWeatherMapKit.instance.currentWeather(forCity: "Samara", withCountryCode: "ru") { (forecast, error) in
    ...
}
```

##### 🌍 Get weather by geo coordinates
You can retrieve weather data for specific geo location by it's coordinates:
```swift
OpenWeatherMapKit.instance.currentWeather(forCoordiante: (latitude: 53.2610313, longitude: 50.0579958)) { (forecast, error) in
    ...
}
```

##### 📆 Get weather forecast for next 5 days
You can retrieve weather data for next five days for specific city by it's name and country code:
```swift
OpenWeatherMapKit.instance.weatherForecastForFiveDays(forCity: "Samara", withCountryCode: "ru") { (forecast, error) in
...
}
```
or for specific geo location by it's coordinates:
```swift
OpenWeatherMapKit.instance.weatherForecastForFiveDays(forCoordiante: (latitude: 53.2610313, longitude: 50.0579958)) { (forecast, error) in
...
}
```

##### 🌤 WeatherItem
All operations for getting current weather data return special object of `WeatherItem` type. `WeatherItem` is a simple struct that contains temperature data on the board. Here are fields you can access on it:
```swift
/// Weather item's temperature values in Kelvin
public let kelvin: (currentTemp: Double, maxTemp: Double, minTemp: Double)
/// Weather item's temperature values in Celsius
public let celsius: (currentTemp: Double, maxTemp: Double, minTemp: Double)
/// Weather item's temperature values in Fahrenheit
public let fahrenheit: (currentTemp: Double, maxTemp: Double, minTemp: Double)
```
For example, if you want to get information on current weather in celsius you achieve that using following statement:
```swift
weatherItem.celsius.currentTemp
```

WeatherItem can be accessed from instances of `ForecastItem`. Here is example:
```swift
forecast.main.celsius.currentTemp
```

## 🛣 Roadmap
Please find project's roadmap below:

| Version | ETA | Feature |
| ------- | --- | ------- |
| ✅ v0.1    | January 2018 | Current weather forecast by city & geo coordinates + support of different units (Celsius, Kelvin, Fahrenheit) |
| ✅ v0.2 | April 2018 | Weather forecast for 5 days / 3 hour by city & geo coordinates. |
| v0.3 | Summer 2018 | 16 day daily forecast by city & geo coordinates. |

<hr/>

⚠️ Support of other platforms (like watchOS, macOS & tvOS) will be introduced later
