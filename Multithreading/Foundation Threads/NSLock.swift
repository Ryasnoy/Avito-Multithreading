import Foundation

class NSLockTest {
  private let lock = NSLock()
  
  func test(i: Int) {
    lock.lock()
    // Do something
    print("NSLockTest test")
    lock.unlock()
  }
}

/* NSLockTest().test(i: 0) */
