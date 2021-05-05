import UIKit

protocol WeatherDailyPresentationLogic {
  func presentWeather(response: WeatherDaily.FetchWeather.Response)
  func presentError(response: Error)
}

class WeatherDailyPresenter: WeatherDailyPresentationLogic {
  weak var viewController: WeatherDailyDisplayLogic?
  
  // MARK: -Do something
  func presentWeather(response: WeatherDaily.FetchWeather.Response) {
    let viewModel = WeatherDaily.FetchWeather.ViewModel(weatherModel: response.weatherResponse)
    viewController?.displayWeather(viewModel: viewModel)
  }

  func presentError(response: Error) {
    viewController?.displayError(error: response)
    print(response.localizedDescription)
  }
}
