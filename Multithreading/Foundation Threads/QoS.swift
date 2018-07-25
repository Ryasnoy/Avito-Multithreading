import Foundation

// Quality of services Foundation Thread
class QosThreadTest {
  func test() {
    let thread = Thread {
      print("QosThreadTest test")
      print(qos_class_self())
    }
    thread.qualityOfService = .userInteractive
    thread.start()
    print(qos_class_main())
    
  }
}

/* QosThreadTest().test() */

