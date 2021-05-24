import UIKit
import CoreLocation

protocol WeatherDailyBusinessLogic {
  func fetchWeather(coordinate: CLLocationCoordinate2D)
  func fetchLocation()
}

protocol WeatherDailyDataStore {
}

final class WeatherDailyInteractor: NSObject, WeatherDailyBusinessLogic, WeatherDailyDataStore {
  var presenter: WeatherDailyPresentationLogic!
  private let worker: WeatherDailyWorker
  let locationManager = CLLocationManager()
  
  init(worker : WeatherDailyWorker) {
    self.worker = worker
    super.init()
    locationManager.delegate = self
  }

  func fetchWeather(coordinate: CLLocationCoordinate2D) {
    let weatherRequest = WeatherRequest(lat: coordinate.latitude, lon: coordinate.longitude)
    worker.fetchWeather(convertible: weatherRequest, complition: { [weak self] result  in
      guard let self = self else { return }
      switch result {
      case .success(let weather):
        let response = WeatherDaily.FetchWeather.Response.init(weatherResponse: weather)
        self.presenter?.presentWeather(response: response)
        print(coordinate, "it is done")
      case .failure(let error):
        self.presenter?.presentError(response: error)
      }
    })
  }
  
  func fetchLocation() {
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
}

extension WeatherDailyInteractor: CLLocationManagerDelegate{
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let currentLocation = locations.last else { return }
    fetchWeather(coordinate: currentLocation.coordinate)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print (error)
    presenter.presentError(response: error)
  }
}
