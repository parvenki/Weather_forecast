//
//  ForecastWeather.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation

struct ForecastWeather: Codable {
    var date: Int
    var mainValue: ForecastWeatherValue
    var elements: [WeatherElement]
    let clouds:CloudsWeather
    let wind: WindWeather

    enum CodingKeys: String, CodingKey {
        case clouds, wind
        case mainValue = "main"
        case date = "dt"
        case elements = "weather"
    }
    
    static func emptyInit() -> ForecastWeather {
        return ForecastWeather(
            date: 0,
            mainValue: ForecastWeatherValue.emptyInit(),
            elements: [],
            clouds: CloudsWeather.emptyInit(),
            wind: WindWeather.emptyInit()
        )
    }
}

extension ForecastWeather: Identifiable {
    var id: String { "\(date)" }
}
