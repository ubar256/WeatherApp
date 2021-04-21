import UIKit

 protocol WeatherDailyDisplayLogic: class {
  func displayWeather(viewModel: WeatherDaily.FetchWeather.ViewModel)
  func displayError(error: Error)
 }
class WeatherDailyViewController: UIViewController {
  // MARK: -TextFields
  @IBOutlet weak var latTextField: UITextField!
  @IBOutlet weak var lonTextField: UITextField!

  // MARK: -TextLabel
  @IBOutlet weak var weatherLabel: UILabel!

   var interactor: WeatherDailyBusinessLogic?
   var router: (NSObjectProtocol & WeatherDailyRoutingLogic & WeatherDailyDataPassing)?
  
   // MARK: -Setup
   private func setup() {
     let viewController = self
     let interactor = WeatherDailyInteractor()
     let presenter = WeatherDailyPresenter()
     let router = WeatherDailyRouter()
     viewController.interactor = interactor
     viewController.router = router
     interactor.presenter = presenter
     presenter.viewController = viewController
     router.viewController = viewController
     router.dataStore = interactor
   }

   // MARK: -Routing
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let scene = segue.identifier {
       let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
       if let router = router, router.responds(to: selector) {
         router.perform(selector, with: segue)
       }
     }
   }

  // MARK: -View lifecycle
  override func viewDidLoad() {
        super.viewDidLoad()
    setup()
    interactor?.fetchWeather(request: WeatherDaily.FetchWeather.Request(lon: 60.9, lat: 39.0))
    }
  // MARK: -Action button
  @IBAction func getWeatherButton(_ sender: UIButton) {
  }
}
extension WeatherDailyViewController: WeatherDailyDisplayLogic {
  func displayWeather(viewModel: WeatherDaily.FetchWeather.ViewModel) {
  }
  func displayError (error: Error) {}
}
