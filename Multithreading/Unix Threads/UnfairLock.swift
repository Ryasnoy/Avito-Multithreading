import Foundation

// The most faster Mutex is SpinLock (Deprecated)

class UnfairLockTest {
  private var lock = os_unfair_lock_s()
  
  func test() {
    os_unfair_lock_lock(&lock)
    // Do something...
    os_unfair_lock_unlock(&lock)
  }
  
}
