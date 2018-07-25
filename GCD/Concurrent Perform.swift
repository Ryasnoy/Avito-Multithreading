import Foundation

// Concurrent Perform

class ConcurrentPerformTest {
  
  func test() {
    DispatchQueue.concurrentPerform(iterations: 3) { i in
      print(i)
    }
  }
  
}
ConcurrentPerformTest().test()
