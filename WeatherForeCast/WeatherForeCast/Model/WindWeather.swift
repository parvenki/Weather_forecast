//
//  WindWeather.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation

struct WindWeather: Codable {
    let speed: Double
    let deg: Int?
    
    static func emptyInit() -> WindWeather {
        return WindWeather(speed: 0.0, deg: nil)
    }
}
