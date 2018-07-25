import Foundation

class SemaphoreTest {
  /*
   Value: count of threads
   */
  private let semaphore = DispatchSemaphore(value: 0)
  
  func test() {
    DispatchQueue.global().async {
      sleep(3)
      print("1")
      self.semaphore.signal()
    }
    semaphore.wait()
  }
}

SemaphoreTest().test()

class SemaphoreTest2 {
  private let semaphore = DispatchSemaphore(value: 2)
  
  func doWork() {
    semaphore.wait()
    print("test")
    sleep(3) // Do something
    semaphore.signal()
  }
  
  func test() {
    DispatchQueue.global().async {
      self.doWork()
    }
    DispatchQueue.global().async {
      self.doWork()
    }
    DispatchQueue.global().async {
      self.doWork()
    }
  }
  
}

SemaphoreTest2().test()
