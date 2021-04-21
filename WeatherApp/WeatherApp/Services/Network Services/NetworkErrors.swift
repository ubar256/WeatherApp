import Foundation

enum NetworkError: String, Error {
  case parametersNil = "Parameters are nill."
  case encodingFailed = "Parameter encoding failed."
  case missingURL = "URL is nil."
  case WrongAPIConstants = "API constants are wrong"
}
