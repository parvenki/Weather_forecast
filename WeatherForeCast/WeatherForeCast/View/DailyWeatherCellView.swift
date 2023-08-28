//
//  DailyWeatherCellView.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import SwiftUI

struct DailyWeatherCellView: View {
    let data: ForecastWeather
    
    var day: String {
        return data.date.dateFromMilliseconds().dayWord()
    }
    var temperatureMax: String {
        return "\(Int(data.mainValue.tempMax))°"
    }

    var temperatureMin: String {
        return "\(Int(data.mainValue.tempMin))°"
    }
    
    var icon: String {
        var image = "WeatherIcon"
        if let weather = data.elements.first {
            image = weather.icon
        }
        return image
    }

    var body: some View {
        HStack {
            Text(day)
                .frame(width: 150, alignment: .leading)
                .accessibilityLabel(day)
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Spacer()
            Text(temperatureMax)
            Spacer().frame(width: 34)
            Text(temperatureMin)
        }.padding(.horizontal, 24)
    }
}

struct DailyWeatherCellView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherCellView(data: ForecastWeather.emptyInit())
    }
}
