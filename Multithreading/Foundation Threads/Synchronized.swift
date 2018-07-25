import Foundation

class SynchronizedTest {
  private let lock = NSObject()
  
  func test() {
    objc_sync_enter(lock)
    print("SynchronizedTest \(#function)")
    objc_sync_exit(lock)
  }
}

/* SynchronizedTest().test() */
