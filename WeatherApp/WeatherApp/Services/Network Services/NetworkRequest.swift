import UIKit

protocol NetworkRequest: UrlRequestConvertible {
  var bodyParams: [String: Any] { get }
  var queryParams: [String: String] { get }
  var endPoint: String { get }
}

extension NetworkRequest {
  var bodyParams: [String: Any] {
    return [:]
  }
  var queryParams: [String: String] {
    return [:]
  }
}
extension NetworkRequest {
  
  func convertUrlRequest() throws -> URLRequest {
    var urlComponents = URLComponents(string: "\(ApiConstants.baseUrl.rawValue)\(endPoint)")
    urlComponents?.queryItems = queryParams.map {URLQueryItem(name: $0, value: $1)}

    let urlQueryToken = URLQueryItem(name: "appid",
                                     value: "\(ApiConstants.apiKey.rawValue)")
    let urlQueryUnits = URLQueryItem(name: "units",
                                     value: "metric")
    let urlQueryExclude = URLQueryItem(name: "exclude",
                                       value: "hourly,daily")
  
    urlComponents?.queryItems?.append(urlQueryExclude)
    urlComponents?.queryItems?.append(urlQueryToken)
    urlComponents?.queryItems?.append(urlQueryUnits)
    guard let components = urlComponents?.url else {
      throw NetworkError.missingURL
    }
    
    var urlRequest = URLRequest(url: components)
    urlRequest.addValue("application/json",
                        forHTTPHeaderField: "Content-Type")
    if !bodyParams.isEmpty {
      urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyParams,
                                                        options: [])
      urlRequest.httpMethod = HttpMethod.post.rawValue
    }
  return urlRequest
  }
}
