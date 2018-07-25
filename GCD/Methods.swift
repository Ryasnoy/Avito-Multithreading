import Foundation

// Async vs Sync

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


