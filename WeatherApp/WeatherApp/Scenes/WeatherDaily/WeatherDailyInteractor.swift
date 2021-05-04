import UIKit

protocol WeatherDailyBusinessLogic {
  func fetchWeather(request: WeatherDaily.FetchWeather.Request)
}

protocol WeatherDailyDataStore {
}

class WeatherDailyInteractor: WeatherDailyBusinessLogic, WeatherDailyDataStore {
  var presenter: WeatherDailyPresentationLogic!
  private let worker: WeatherDailyWorker
  
  init(worker : WeatherDailyWorker) {
    self.worker = worker
  }

  func fetchWeather(request: WeatherDaily.FetchWeather.Request) {
    let weatherRequest = WeatherRequest(lat: request.lat, lon: request.lon)
    worker.fetchWeather(convertible: weatherRequest, complition: { [weak self] result  in
      guard let self = self else { return }
      switch result {
      case .success(let weather):
        let response = WeatherDaily.FetchWeather.Response.init(weatherResponse: weather)
        self.presenter?.presentWeather(response: response)
      case .failure(let error):
        self.presenter?.presentError(response: error)
      }
    })
  }
}
