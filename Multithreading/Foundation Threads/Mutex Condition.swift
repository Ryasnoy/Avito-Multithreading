import Foundation

class NSConditionTest {
  private let condition = NSCondition()
  private var check = false
  
  func test1() {
    condition.lock()
    while !check {
      condition.wait()
      print("Condition wait")
    }
    print("NSConditionTest \(#function)")
    condition.unlock()
  }
  
  func test2() {
    condition.lock()
    check = true
    print("NSConditionTest \(#function)")
    condition.signal()
    condition.unlock()
  }
  
}

/* NSConditionTest().test1() */
