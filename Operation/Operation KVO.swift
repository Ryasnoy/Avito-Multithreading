import Foundation

class OperationKVOTest: NSObject {
  func test() {
    let operation = Operation()
    operation.addObserver(self, forKeyPath: "isCancelled", options: .new, context: nil)
  }
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "isCancelled" {
      // Handle
    }
  }
  
}
