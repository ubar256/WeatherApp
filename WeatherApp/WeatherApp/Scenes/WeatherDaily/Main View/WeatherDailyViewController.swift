import UIKit

 protocol WeatherDailyDisplayLogic: class {
  func displayWeather(viewModel: WeatherDaily.FetchWeather.ViewModel)
  func displayError(error: Error)
 }

class WeatherDailyViewController: UIViewController {
  private var weatherCollectionView = WeatherCollectionView()
  // MARK: -TextLabel
  @IBOutlet weak var weatherLabel: UILabel!
  
  var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .white
    label.textColor = .black
    label.font = .systemFont(ofSize: 18, weight: .light)
    return label
  }()

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
    
    view.addSubview(weatherCollectionView)
    view.addSubview(descriptionLabel)
    
    descriptionLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5).isActive = true
    descriptionLabel.centerXAnchor.constraint(equalTo: weatherLabel.centerXAnchor).isActive = true
    descriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    weatherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    weatherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    weatherCollectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
    weatherCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
  }
  // MARK: -Action button
  @IBAction func getWeatherButton(_ sender: UIButton) {
  }
}

extension WeatherDailyViewController: WeatherDailyDisplayLogic {
  func displayWeather(viewModel: WeatherDaily.FetchWeather.ViewModel) {
    weatherLabel.text = viewModel.weatherModel.timezone
    descriptionLabel.text = "Now it's " + viewModel.weatherModel.current.weather[0].description
    weatherCollectionView.updateViewModel(with: viewModel.weatherModel.daily)
    weatherCollectionView.reloadData()
  }
  
  func displayError (error: Error) {
    weatherLabel.text = error.localizedDescription
  }
}
