//
//  CloudsWeather.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation

struct CloudsWeather: Codable {
    let all: Int

    static func emptyInit() -> CloudsWeather {
        return CloudsWeather(all: 0)
    }
}
