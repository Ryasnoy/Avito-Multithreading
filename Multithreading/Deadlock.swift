import Foundation

class DeadLockTest {
  
  let lock1 = NSLock()
  let lock2 = NSLock()
  
  var resourceA = false
  var resourceB = false
}

let deadLock = DeadLockTest()

let thread1 = Thread {
  deadLock.lock1.lock()
  deadLock.resourceA = true
  deadLock.lock2.lock()
  deadLock.resourceB = true
  deadLock.lock2.unlock()
  deadLock.lock1.unlock()
}
thread1.start()

let thread2 = Thread {
  deadLock.lock2.lock()
  deadLock.resourceA = true
  deadLock.lock1.lock()
  deadLock.resourceB = true
  deadLock.lock1.unlock()
  deadLock.lock2.unlock()
}
thread2.start()
