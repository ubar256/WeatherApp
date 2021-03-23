
import UIKit

protocol CreateOrderBusinessLogic
{
  func doSomething(request: CreateOrder.Something.Request)
}

protocol CreateOrderDataStore
{
  //var name: String { get set }
}

class CreateOrderInteractor: CreateOrderBusinessLogic, CreateOrderDataStore
{
  var presenter: CreateOrderPresentationLogic?
  var worker: CreateOrderWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: CreateOrder.Something.Request)
  {
    worker = CreateOrderWorker()
    worker?.doSomeWork()
    
    let response = CreateOrder.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
