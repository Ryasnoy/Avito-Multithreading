import Foundation

/*     For system events
 - Dispatch Source -
 *  Timer dispatch source       *
 *  Signal dispatch source      * - For Unix signals
 *  Descriptor dispatch source  *
 *  Process dispatch source     * - For Processes events
 --------------------------------
 */

class DispatchSourceTest1 {
  private let source = DispatchSource.makeTimerSource()
  
  func test() {
    source.setEventHandler {
      print("test")
    }
    source.schedule(deadline: .now(), repeating: 5)
    source.activate()
  }
  
}

DispatchSourceTest1().test()

class DispatchSourceTest2 {
  private let source = DispatchSource.makeUserDataAddSource(queue: .main)
  
  init() {
    source.setEventHandler {
      print("Event")
    }
    source.activate()
  }
  
  func test() {
    DispatchQueue.global().async {
      self.source.add(data: 10)
    }
  }
  
}

DispatchSourceTest2().test()
