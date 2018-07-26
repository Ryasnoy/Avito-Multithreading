import Foundation

class TargetQueueHierarchyTest1 {
  private let targetQueue = DispatchQueue(label: "TargetQueue")
  
  func test() {
    let queue1 = DispatchQueue(label: "Queue1", target: targetQueue)
    let dispatchSource1 = DispatchSource.makeTimerSource(queue: queue1)
    dispatchSource1.setEventHandler {
      print("test1")
    }
    dispatchSource1.activate()
    
    let queue2 = DispatchQueue(label: "Queue2", target: targetQueue)
    let dispatchSource2 = DispatchSource.makeTimerSource(queue: queue2)
    dispatchSource2.setEventHandler {
      print("test2")
    }
    dispatchSource2.activate()
  }
}
