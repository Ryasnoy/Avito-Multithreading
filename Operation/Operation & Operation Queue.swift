import Foundation

class OperationTest {
  class OperationA: Operation {
    override func main() {
      print("test")
    }
  }
  private let operationQueue = OperationQueue()
  
  func test() {
    let testOperation = OperationA()
    operationQueue.addOperation(testOperation)
  }
  
}

OperationTest().test()

class OperationTest2 {
  private let operationQueue = OperationQueue()
  
  func test() {
    operationQueue.addOperation {
      print("test")
    }
  }
}
OperationTest2().test()
