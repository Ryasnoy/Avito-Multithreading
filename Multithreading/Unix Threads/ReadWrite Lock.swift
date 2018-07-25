import Foundation

// Only Unix functional

class ReadWriteLockTest {
  private var lock = pthread_rwlock_t()
  private var attr = pthread_rwlockattr_t()
  
  private var test = 0
  
  init() {
    pthread_rwlock_init(&lock, &attr)
  }
  
  var testProperty: Int {
    get {
      pthread_rwlock_rdlock(&lock)
      let tmp = test
      pthread_rwlock_unlock(&lock)
      return tmp
    }
    set {
      pthread_rwlock_wrlock(&lock)
      test = newValue
      pthread_rwlock_unlock(&lock)
    }
  }
  
}
