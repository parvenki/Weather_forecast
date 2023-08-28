//
//  ForecastWeatherCity.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation

struct ForecastWeatherCity: Codable {
    let id: Int
    let name: String
    let coordinate: Coordinate
    let country: String
    let timezone, sunrise, sunset: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case coordinate = "coord"
        case country, timezone, sunrise, sunset
    }
    
    static func emptyInit() -> ForecastWeatherCity {
        return ForecastWeatherCity(
            id: 0,
            name: "",
            coordinate: Coordinate.emptyInit(),
            country: "",
            timezone: 0,
            sunrise: 0,
            sunset: 0
        )
    }
}
