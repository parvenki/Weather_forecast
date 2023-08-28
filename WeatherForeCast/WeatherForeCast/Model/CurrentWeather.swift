//
//  CurrentWeather.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation
/// Current Weather mapping
struct CurrentWeather: Codable {
    let timezone, id: Int
    let name: String
    let coordinate: Coordinate
    let elements: [WeatherElement]
    let base: String
    let mainValue: CurrentWeatherMainValue
    let visibility: Int
    let wind: WindWeather
    let clouds: CloudsWeather
    let date: Int
    let sys: CurrentWeatherSys
    let code: Int
    
    enum CodingKeys: String, CodingKey {
        case base, visibility, wind, clouds, sys, timezone, id, name
        case elements = "weather"
        case coordinate = "coord"
        case mainValue = "main"
        case date = "dt"
        case code = "cod"
    }
    
    static func emptyInit() -> CurrentWeather {
        return CurrentWeather(
            timezone: 0,
            id: 0,
            name: "",
            coordinate: Coordinate.emptyInit(),
            elements: [],
            base: "",
            mainValue: CurrentWeatherMainValue.emptyInit(),
            visibility: 0,
            wind: WindWeather.emptyInit(),
            clouds: CloudsWeather.emptyInit(),
            date: 0,
            sys: CurrentWeatherSys.emptyInit(),
            code: 0
        )
    }
    
    func description() -> String {
        var result = "Today: "
        if let weatherElement = elements.first {
            result += "\(weatherElement.weatherDescription) currently. ".capitalized(with: .autoupdatingCurrent)
        }
        result += "It's \(mainValue.temp)°."
        return result
    }
    
    func getForecastWeather() -> ForecastWeather {
        var result = ForecastWeather.emptyInit()

        result.date = self.date
        result.mainValue.tempMin = self.mainValue.tempMin
        result.mainValue.tempMax = self.mainValue.tempMax

        if let weatherElement = elements.first {
            result.elements.append(weatherElement)
        }

        return result
    }
}
