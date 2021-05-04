import Foundation
//MARK: -Setup
class WeatherDailyAssembly {
  
  func setup(viewController: WeatherDailyViewController) {
      let presenter = WeatherDailyPresenter()
      let router = WeatherDailyRouter()
      let worker = WeatherDailyWorker()
      let interactor = WeatherDailyInteractor(worker: worker)
      viewController.interactor = interactor
      viewController.router = router
      interactor.presenter = presenter
      presenter.viewController = viewController
      router.viewController = viewController
      router.dataStore = interactor
  }
}
