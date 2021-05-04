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
    //WeatherCollectionView.init()
    //WeatherCollectionView.init().cells = viewModel
    
  }
//  
//  func collectionViewPresent(response: WeatherDaily.FetchWeather.Response) {
//    let collModel = WeatherDaily.FetchWeather.ViewModel(weatherModel: response.weatherResponse)
//    WeatherCollectionView.init().cells = collModel
//  }
//  
  func presentError(response: Error) {
    viewController?.displayError(error: response)
    print(response.localizedDescription)
  }
}
