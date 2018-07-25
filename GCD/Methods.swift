import Foundation

// Async vs Sync

// Serial Queue

class AsyncVsSyncTest1 {
  private let serialQueue = DispatchQueue(label: "serialTest")
  
  func testSerial() {
    serialQueue.async {
      print("test1")
    }
    serialQueue.async {
      sleep(1)
      print("test2")
    }
    serialQueue.sync {
      print("test3")
    }
    serialQueue.sync {
      print("test4")
    }
  }
}

// Concurrent Queue

class AsyncVsSyncTest2 {
  private let concurrentQueue = DispatchQueue.global()
  
  func testConcurrent() {
    concurrentQueue.async {
      print("test1")
    }
    concurrentQueue.async {
      sleep(1)
      print("test2")
    }
    concurrentQueue.sync {
      print("test3")
    }
    concurrentQueue.sync {
      print("test4")
    }
  }
}
AsyncVsSyncTest2().testConcurrent()
