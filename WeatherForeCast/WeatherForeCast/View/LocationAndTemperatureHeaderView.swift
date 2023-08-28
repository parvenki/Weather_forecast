//
//  LocationAndTemperatureHeaderView.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import SwiftUI

struct LocationAndTemperatureHeaderView: View {
    let data: CurrentWeather

    var weatherName: String {
        var result = ""
        if let weather = data.elements.first {
            result = weather.main
        }
        return result
    }
    
    var temperature: String {
        return "\(Int(data.mainValue.temp))°"
    }

    var body: some View {
        VStack {
            Text(data.name)
                .font(.largeTitle)
                .fontWeight(.medium)
            Text(weatherName)
                .font(.body)
                .fontWeight(.light)
                .padding(.bottom, 4)
            Text(temperature)
                .font(.system(size: 86))
                .fontWeight(.thin)
        }
        .padding(.vertical, 24)
    }
}
