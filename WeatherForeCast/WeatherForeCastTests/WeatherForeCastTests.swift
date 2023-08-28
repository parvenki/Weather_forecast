//
//  WeatherForeCastTests.swift
//  WeatherForeCastTests
//
//  Created by Venkat_Sravani on 8/26/23.
//

import XCTest
@testable import WeatherForeCast
import Combine

final class WeatherForeCastTests: XCTestCase {

    var viewModel: WeatherForecastViewModel!

    override func setUpWithError() throws {
    }
    func testWeatherViewModelData() {
        XCTAssertEqual(viewModel.cityId, "4736286")
    }

}
