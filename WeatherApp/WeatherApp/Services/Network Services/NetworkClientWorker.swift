import UIKit

protocol NetworkClient {
  func request<T: Decodable>(convertible: UrlRequestConvertible, completion: @escaping (Result<T, Error>) -> Void)
}

class DefaultNetworkClient: NetworkClient {
  func request<T: Decodable>(convertible: UrlRequestConvertible, completion: @escaping (Result<T, Error>)-> Void) {
    guard let defaultRequest = try? convertible.convertUrlRequest() else { return }
    URLSession.shared.dataTask(with: defaultRequest) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
        return
      }
      
      if let data = data {
        do {
          let result = try JSONDecoder().decode(T.self, from: data)
          DispatchQueue.main.async {
            completion(.success(result))
          }
        } catch let jsonError {
          DispatchQueue.main.async {
            completion(.failure(jsonError))
          }
        }
      }
    }.resume()
  }
}
