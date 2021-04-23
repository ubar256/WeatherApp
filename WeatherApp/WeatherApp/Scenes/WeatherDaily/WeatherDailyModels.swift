import UIKit

enum WeatherDaily {
  // MARK: -Use cases
  enum FetchWeather {
    
    struct Request {
      let lon: Double
      let lat: Double
    }
    
    struct Response {
      let weatherResponse: WeatherCallAPI
    }
    
    struct ViewModel {
      let weatherModel: WeatherCallAPI
    }
  }
}
