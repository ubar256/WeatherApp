import Foundation

protocol UrlRequestConvertible {
  func convertUrlRequest() throws -> URLRequest
}
