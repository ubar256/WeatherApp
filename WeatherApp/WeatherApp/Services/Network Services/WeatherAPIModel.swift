import UIKit

struct WeatherCallAPI: Decodable {
  let lat: Double
  let lon: Double
  let current: Current
  let timezone: String
  let daily: [Daily]
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

struct Daily: Decodable {
  let temp: Temp
  let dt: Int
  let weather: [Weather]
}

struct Temp: Decodable {
  var day: Double
  var night: Double
}
