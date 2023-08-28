import Foundation

enum AppConstants {
    enum Api {
        static let apiUrl = URL(string: "http://api.openweathermap.org/data/2.5/air_pollution?")!
        static let apiKey = "2e0ed7d7d722ff8d895fd0d59421dfe5"

        enum QueryKey: String {
            case apiKey = "key"
            case searchString = "q"
            case format = "format"

            // Weather Query
            case cnt = "cnt"
            case lat = "lat"
            case lon = "lon"
            case monthlyCondition = "mca"
            case location = "includelocation"
            case comments = "show_comments"
            case tp = "tp"
        }

        enum QueryValue {
            static let numOfDays = "5"
            static let forcast = "yes"
            static let currentCondition = "yes"
            static let monthlyCondition = "no"
            static let location = "no"
            static let comments = "no"
            static let tp = "1"
        }
    }

    enum A11y {
        static let searchTextField = "searchTextField"
        static let searchResultList = "searchResultList"
        static let searchEmptyResultContainer = "searchEmptyResultContainer"

        static let weatherAddButton = "weatherAddButton"
        static let weatherCancelButton = "weatherCancelButton"
        static let weatherDismissButton = "weatherDismissButton"

        static let placesScrollView = "placesScrollView"
        static let removePlaceButton = "removePlaceButton"
        static let editPlacesButton = "editPlacesButton"
    }
}
