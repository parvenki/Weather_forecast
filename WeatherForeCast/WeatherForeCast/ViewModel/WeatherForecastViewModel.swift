//
//  WeatherForecastViewModel.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation
import SwiftUI
import Combine

class WeatherForecastViewModel: ObservableObject {
    let client = OpenweatherAPI()

    var state: State = State.loading {
        willSet {
            objectWillChange.send()
        }
    }

    var currentWeather = CurrentWeather.emptyInit() {
        willSet {
            objectWillChange.send()
        }
    }
    
    var todayWeather = ForecastWeather.emptyInit() {
        willSet {
            objectWillChange.send()
        }
    }

    var hourlyWeathers: [ForecastWeather] = [] {
        willSet {
            objectWillChange.send()
        }
    }

    var dailyWeathers: [ForecastWeather] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    var currentDescription = "" {
        willSet {
            objectWillChange.send()
        }
    }
        
    private var stateCurrentWeather = State.loading
    private var stateForecastWeather = State.loading
    let cityId = "4736286" // City Id

    init() {
        getData()
    }
    
    func retry() {
        state = .loading
        stateCurrentWeather = .loading
        stateForecastWeather = .loading
        
        getData()
    }
    
    private func getData() {
        client.getCurrentWeather(at: cityId) { [weak self] currentWeather, error in
            guard let ws = self else { return }
            if let currentWeather = currentWeather {
                ws.currentWeather = currentWeather
                ws.todayWeather = currentWeather.getForecastWeather()
                ws.currentDescription = currentWeather.description()
                ws.stateCurrentWeather = .success
            } else {
                ws.stateCurrentWeather = .failed
            }
            ws.updateStateView()
        }

        client.getForecastWeather(at: cityId) { [weak self] forecastWeatherResponse, error in
            guard let ws = self else { return }
            if let forecastWeatherResponse = forecastWeatherResponse {
                ws.hourlyWeathers = forecastWeatherResponse.list
                ws.dailyWeathers = forecastWeatherResponse.dailyList
                ws.stateForecastWeather = .success
            } else {
                ws.stateForecastWeather = .failed
            }
            ws.updateStateView()
        }
    }
        
    private func updateStateView() {
        if stateCurrentWeather == .success, stateForecastWeather == .success {
            state = .success
        }
        
        if stateCurrentWeather == .failed, stateForecastWeather == .failed {
            state = .failed
        }
    }
}
