//
//  ForecastWeatherResp.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation

struct ForecastWeatherResp: Codable {
    let code: String
    let message, count: Int
    let list: [ForecastWeather]
    let city: ForecastWeatherCity
    
    enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
        case count = "cnt"
        case list, city
    }
    
    static func emptyInit() -> ForecastWeatherResp {
        return ForecastWeatherResp(
            code: "",
            message: 0,
            count: 0,
            list: [],
            city: ForecastWeatherCity.emptyInit()
        )
    }
    
    var dailyList: [ForecastWeather] {
        var result: [ForecastWeather] = []
        guard var before = list.first else {
            return result
        }
        
        if before.date.dateFromMilliseconds().dayWord() != Date().dayWord() {
            result.append(before)
        }

        for weather in list {
            if weather.date.dateFromMilliseconds().dayWord() != before.date.dateFromMilliseconds().dayWord() {
                result.append(weather)
            }
            before = weather
        }

        return result
    }
}
