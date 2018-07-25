import Foundation

// Pseudo Code

@available(iOS, deprecated: 10.0, message: "Use atomic_thread_fence() from <stdatomic.h> instead")
class MemoryBarrierTest {
  class TestClass {
    var t1: Int?
    var t2: Int?
  }
  var testClass: TestClass?
  
  func test() {
    let thread1 = Thread {
      let tmp = TestClass()
      tmp.t1 = 100
      tmp.t2 = 500
      OSMemoryBarrier()
    }
    thread1.start()
    
    let thread2 = Thread {
      while self.testClass == nil {}
      OSMemoryBarrier()
      print(self.testClass?.t1)
    }
    thread2.start()
  }
  
}


