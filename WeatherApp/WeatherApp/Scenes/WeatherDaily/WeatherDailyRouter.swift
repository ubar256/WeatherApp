import UIKit

@objc protocol WeatherDailyRoutingLogic {
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol WeatherDailyDataPassing {
  var dataStore: WeatherDailyDataStore? { get }
}

class WeatherDailyRouter: NSObject, WeatherDailyRoutingLogic, WeatherDailyDataPassing {
  weak var viewController: WeatherDailyViewController?
  var dataStore: WeatherDailyDataStore?
  
  // MARK: -Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?) {
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: -Navigation
  //func navigateToSomewhere(source: WeatherDailyViewController, destination: SomewhereViewController) {
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: -Passing data
  //func passDataToSomewhere(source: WeatherDailyDataStore, destination: inout SomewhereDataStore) {
  //  destination.name = source.name
  //}
}
