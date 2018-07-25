import Foundation

// Async after

class AsyncAfterTest {
  private let concurrentQueue = DispatchQueue(label: "AsyncAfterTest", attributes: .concurrent)
  func test() {
    concurrentQueue.asyncAfter(deadline: .now() + 3) {
      print("Test")
    }
  }
}

AsyncAfterTest().test()
