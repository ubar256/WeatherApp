import UIKit

protocol WeatherDailyPresentationLogic {
  func presentWeather(response: WeatherDaily.FetchWeather.Response)
  func presentError(_ error: Error)
}

class WeatherDailyPresenter: WeatherDailyPresentationLogic {
  weak var viewController: WeatherDailyDisplayLogic?
  
  // MARK: -Do something
  func presentWeather(response: WeatherDaily.FetchWeather.Response) {
    viewController?.displayWeather(viewModel: WeatherDaily.FetchWeather.ViewModel())
    print(response.weather)
  }
  
  func presentError(_ error: Error) {
    print(error.localizedDescription)
  }
  
}

