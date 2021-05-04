import UIKit

struct WeatherCallAPI: Decodable {
  let lat: Double
  let lon: Double
  let current: Current
  let timezone: String
}

struct Current: Decodable {
    let dt: Int
    let weather: [Weather]
    let temp: Double
  }

struct Weather: Decodable {
  let id: Int
  let description: String
}
