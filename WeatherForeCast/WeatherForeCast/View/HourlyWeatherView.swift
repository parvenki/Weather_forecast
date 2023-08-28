//
//  HourlyWeatherView.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import SwiftUI

struct HourlyWeatherView: View {
    let data: [ForecastWeather]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(data) { data in
                    HourlyWeatherCellView(data: data)
                    Spacer().frame(width: 24)
                }
            }.padding(.horizontal, 24)
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(data: [ForecastWeather.emptyInit()])
    }
}
