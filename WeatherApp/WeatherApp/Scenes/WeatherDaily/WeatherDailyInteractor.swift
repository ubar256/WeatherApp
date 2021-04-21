import UIKit

protocol WeatherDailyBusinessLogic {
  func fetchWeather(request: WeatherDaily.FetchWeather.Request)
}

protocol WeatherDailyDataStore {
}

class WeatherDailyInteractor: WeatherDailyBusinessLogic, WeatherDailyDataStore {
  var presenter: WeatherDailyPresentationLogic!
  let worker = WeatherDailyWorker()
  
  func fetchWeather(request: WeatherDaily.FetchWeather.Request) {
    let weatherRequest = WeatherRequest(lat: request.lat, lon: request.lon)
    worker.fetchWeather(convertible: weatherRequest, complition: { [weak self] (result : Result<WeatherCallAPI, Error>) in
      guard let self = self else { return }
      switch result {
      case .success(let weather):
        self.presenter?.presentWeather(response: .init(weather: weather))
      case .failure(let error):
        self.presenter?.presentError(error)
      }
    })
  }
}
