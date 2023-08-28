//
//  OpenweatherAPI.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation

class OpenweatherAPI {
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    typealias ForecastWeatherCompletionHandler = (ForecastWeatherResp?, Error?) -> Void

    private let apiKey = "2e0ed7d7d722ff8d895fd0d59421dfe5"
    private let decoder = JSONDecoder()
    private let session: URLSession

    private enum SuffixURL: String {
        case forecastWeather = "forecast"
        case currentWeather = "weather"
    }
        
    private func baseUrl(_ suffixURL: SuffixURL, param: String) -> URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/\(suffixURL.rawValue)?APPID=\(self.apiKey)&units=metric\(param)")!
    }
        
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
        
    private func getBaseRequest<T: Codable>(at cityId: String,
                                            suffixURL: SuffixURL,
                                            completionHandler completion:  @escaping (_ object: T?,_ error: Error?) -> ()) {
        
        let url = baseUrl(suffixURL, param: "&id=\(cityId)")
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, ErrorResponse.requestFailed)
                        return
                    }
                    
                    if httpResponse.statusCode == 200 {
                        do {
                            let weather = try self.decoder.decode(T.self, from: data)
                            completion(weather, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, ErrorResponse.invalidData)
                    }
                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
    
    func getCurrentWeather(at cityId: String, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getBaseRequest(at: cityId, suffixURL: .currentWeather) { (weather: CurrentWeather?, error) in
            completion(weather, error)
        }
    }
    
    func getForecastWeather(at cityId: String, completionHandler completion: @escaping ForecastWeatherCompletionHandler) {
        getBaseRequest(at: cityId, suffixURL: .forecastWeather) { (weather: ForecastWeatherResp?, error) in
            completion(weather, error)
        }
    }
}
