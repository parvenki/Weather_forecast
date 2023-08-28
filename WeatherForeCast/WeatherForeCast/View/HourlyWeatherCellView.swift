//
//  HourlyWeatherCellView.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import SwiftUI

struct HourlyWeatherCellView: View {
    var data: ForecastWeather

    var hour: String {
        return data.date.dateFromMilliseconds().hour()
    }

    var temperature: String {
        return "\(Int(data.mainValue.temp))°"
    }

    var icon: String {
        var image = "WeatherIcon"
        if let weather = data.elements.first {
            image = weather.icon
        }
        return image
    }

    var body: some View {
        VStack {
            Text(hour)
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text(temperature)
        }.padding(.all, 0)
    }
}

struct HourlyWeatherCellView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherCellView(data: ForecastWeather.emptyInit())
    }
}
