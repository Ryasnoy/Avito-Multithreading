import Foundation

class NSRecursiveLockTest {
  private let lock = NSRecursiveLock()
  
  func test1() {
    lock.lock()
    print("NSRecursiveLockTest \(#function)")
    test2()
    lock.unlock()
  }
  
  func test2() {
    lock.lock()
    print("NSRecursiveLockTest \(#function)")
    lock.unlock()
  }
}

/* NSRecursiveLockTest().test1() */
