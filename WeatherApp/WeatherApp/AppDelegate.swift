import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions
      launchOptions:[UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    let viewController = storyboard.instantiateViewController(identifier: "WeatherDailyViewController")
    guard let weatherDailyViewController = viewController as? WeatherDailyViewController else {
      return false
    }
    WeatherDailyAssembly().setup(viewController: weatherDailyViewController)
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
    return true
  }
}
