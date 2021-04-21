import UIKit

protocol WeatherDailyPresentationLogic {
  func presentWeather(response: WeatherDaily.FetchWeather.Response)
  func presentError(_ error: Error)
}

class WeatherDailyPresenter: WeatherDailyPresentationLogic {
  weak var viewController: WeatherDailyDisplayLogic?
  
  // MARK: -Do something
  func presentWeather(response: WeatherDaily.FetchWeather.Response) {
    let weatherView = response.weatherResponse
    viewController?.displayWeather(viewModel: WeatherDaily.FetchWeather.ViewModel(weatherModel: weatherView))
    print(response.weatherResponse.timezone)
  }
  
  func presentError(_ error: Error) {
    print(error.localizedDescription)
  }
  
}

