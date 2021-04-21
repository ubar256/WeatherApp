import UIKit

enum WeatherDaily {
    
  // MARK: -Use cases
  enum FetchWeather {
    struct Request {
      let lon: Double
      let lat: Double
    }
    struct Response {
      let weather: WeatherCallAPI
    }
    struct ViewModel {
    }
  }
}
