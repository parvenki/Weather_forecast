//
//  Coordinate.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import Foundation
/// Cordinates ( lat/long) values for current location 
struct Coordinate: Codable {
    let lon, lat: Double
    
    static func emptyInit() -> Coordinate {
        return Coordinate(lon: 0, lat: 0)
    }
}
