import UIKit

@objc protocol WeatherDailyRoutingLogic {
}

protocol WeatherDailyDataPassing {
  var dataStore: WeatherDailyDataStore? { get }
}

class WeatherDailyRouter: NSObject, WeatherDailyRoutingLogic, WeatherDailyDataPassing {
  weak var viewController: WeatherDailyViewController?
  var dataStore: WeatherDailyDataStore?
}
