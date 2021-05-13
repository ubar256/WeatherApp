import UIKit

final class WeatherDailyWorker {
  private let networkClient = DefaultNetworkClient()
  
  func fetchWeather(convertible: UrlRequestConvertible, complition: @escaping (Result<WeatherCallAPI,Error>)-> Void) {
    networkClient.request(convertible: convertible, completion: complition)
  }
}
