import UIKit

protocol WeatherDailyPresentationLogic {
  func presentSomething(response: WeatherDaily.Something.Response)
}

class WeatherDailyPresenter: WeatherDailyPresentationLogic {
  weak var viewController: WeatherDailyDisplayLogic?
  
  // MARK: -Do something
  func presentSomething(response: WeatherDaily.Something.Response) {
    let viewModel = WeatherDaily.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
