import Foundation

struct WeatherRequest: NetworkRequest {
  var endPoint = ApiConstants.oneCall.rawValue
  private let lat: Double
  private let lon: Double
  
  init(lat: Double, lon:Double) {
    self.lat = lat
    self.lon = lon
  }
    
 // private let exclude: String = "hourly,daily"
  var bodyParams: [String : Any] = [:]
  var queryParams: [String : String] {
    return [
            "lat": String (lat),
            "lon": String (lon),
    ]
  }
}


