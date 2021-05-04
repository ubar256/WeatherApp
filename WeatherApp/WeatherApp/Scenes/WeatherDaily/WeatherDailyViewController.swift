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
    interactor?.fetchWeather(request: WeatherDaily.FetchWeather.Request(lon: 37.7, lat: 55.5))
    }
  // MARK: -Action button
  @IBAction func getWeatherButton(_ sender: UIButton) {
  }
}

extension WeatherDailyViewController: WeatherDailyDisplayLogic {
  func displayWeather(viewModel: WeatherDaily.FetchWeather.ViewModel) {
    weatherLabel.text = viewModel.weatherModel.timezone
  }
  func displayError (error: Error) {
    weatherLabel.text = error.localizedDescription
  }
}
