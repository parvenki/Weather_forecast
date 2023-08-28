import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherViewModel = WeatherForecastViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                if weatherViewModel.state  == .loading {
                    ActivityIndicatorView(isAnimating: true).configure {
                        $0.color = .white
                    }
                }
                
                if weatherViewModel.state  == .success {
                    LocationAndTemperatureHeaderView(data: weatherViewModel.currentWeather)
                    Spacer()

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            DailyWeatherCellView(data: weatherViewModel.todayWeather)
                            Rectangle().frame(height: CGFloat(1))

                            HourlyWeatherView(data: weatherViewModel.hourlyWeathers)
                            Rectangle().frame(height: CGFloat(1))

                            DailyWeatherView(data: weatherViewModel.dailyWeathers)
                            Rectangle().frame(height: CGFloat(1))

                            Text(weatherViewModel.currentDescription)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(
                                    .init(arrayLiteral:.leading,.trailing),
                                    24
                                )
                            Rectangle().frame(height: CGFloat(1))

                            DetailsCurrentWeatherView(data: weatherViewModel.currentWeather)
                            Rectangle().frame(height: CGFloat(1))

                        }
                    }
                    Spacer()
                }
                
                if weatherViewModel.state == .failed {
                    Button(action: {
                        self.weatherViewModel.retry()
                    }) {
                        Text("Refresh ()")
                            .foregroundColor(.white)
                    }
                }
            }
        }.colorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
