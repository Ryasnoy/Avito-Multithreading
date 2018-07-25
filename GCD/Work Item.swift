import Foundation

class DispatchWorkItemTest1 {
  private let queue = DispatchQueue(label: "DispatchWorkItemTest1", attributes: .concurrent)
  
  func testNotify() {
    let item = DispatchWorkItem {
      print("test")
    }
    
    item.notify(queue: .main, execute: {
      print("finish")
    })
    
    queue.async(execute: item)
  }
  
}

DispatchWorkItemTest1().testNotify()

class DispatchWorkItemTest2 {
  private let queue = DispatchQueue(label: "DispatchWorkItemTest2")
  
  func testCancel() {
    queue.async {
      sleep(1)
      print("test1")
    }
    queue.async {
      sleep(1)
      print("test2")
    }
    
    let item = DispatchWorkItem {
      print("test")
    }
    
    queue.async(execute: item)
    
    item.cancel()
    
  }
  
}

DispatchWorkItemTest2().testCancel()
