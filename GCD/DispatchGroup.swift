import Foundation

class DispatchGroupTest1 {
  private let group = DispatchGroup()
  private let queue = DispatchQueue(label: "DispatchGroupTest1", attributes: .concurrent)
  
  func testNotify() {
    queue.async(group: group) {
      sleep(1)
      print("1")
    }
    queue.async(group: group) {
      sleep(2)
      print("2")
    }
    group.notify(queue: .main) {
      print("finish all")
    }
  }
}

DispatchGroupTest1().testNotify()


class DispatchGroupTest2 {
  private let group = DispatchGroup()
  private let queue = DispatchQueue(label: "DispatchGroupTest2", attributes: .concurrent)
  
  func testWait() {
    group.enter()
    queue.async(group: group) {
      sleep(1)
      print("1")
      self.group.leave()
    }
    group.enter()
    queue.async(group: group) {
      sleep(2)
      print("2")
      self.group.leave()
    }
    group.wait()
    print("finish all")
    
  }
}

DispatchGroupTest2().testWait()
