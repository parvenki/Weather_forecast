//
//  ForecastWeatherValue.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation

struct ForecastWeatherValue: Codable {
    let temp, feelsLike: Double
    var tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
    
    static func emptyInit() -> ForecastWeatherValue {
        return ForecastWeatherValue(
            temp: 0.0,
            feelsLike: 0.0,
            tempMin: 0.0,
            tempMax: 0.9,
            pressure: 0,
            seaLevel: 0,
            grndLevel: 0,
            humidity: 0,
            tempKf: 0
        )
    }
}
