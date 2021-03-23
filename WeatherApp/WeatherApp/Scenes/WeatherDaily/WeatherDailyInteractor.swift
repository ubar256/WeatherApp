import UIKit

protocol WeatherDailyBusinessLogic {
  func doSomething(request: WeatherDaily.Something.Request)
}

protocol WeatherDailyDataStore {
  //var name: String { get set }
}

class WeatherDailyInteractor: WeatherDailyBusinessLogic, WeatherDailyDataStore {
  var presenter: WeatherDailyPresentationLogic?
  var worker: WeatherDailyWorker?
  //var name: String = ""
  
  // MARK: -Do something
  func doSomething(request: WeatherDaily.Something.Request) {
    worker = WeatherDailyWorker()
    worker?.doSomeWork()
    
    let response = WeatherDaily.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
