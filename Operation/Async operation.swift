import Foundation

class AsyncOperation: Operation {
  private var finish = false
  private var execute = false
  private let queue = DispatchQueue(label: "AsyncOperation")
  
  override var isAsynchronous: Bool { return true }
  override var isFinished: Bool { return finish }
  override var isExecuting: Bool {return execute}
  
  override func start() {
    queue.async {
      self.main()
    }
    execute = true
  }
  
  override func main() {
    print("test")
    finish = true
    execute = false
  }
  
}

// KVO + Async

class KVOAsyncOperation: Operation {
  private var finish = false
  private var execute = false
  private let queue = DispatchQueue(label: "AsyncOperation")
  
  override var isAsynchronous: Bool { return true }
  override var isFinished: Bool { return finish }
  override var isExecuting: Bool {return execute}
  
  override func start() {
    willChangeValue(forKey: "isExecuting")
    queue.async {
      self.main()
    }
    execute = true
    didChangeValue(forKey: "isExecuting")
  }
  
  override func main() {
    print("test")
    willChangeValue(forKey: "isFinished")
    willChangeValue(forKey: "isExecuting")
    finish = true
    execute = false
    didChangeValue(forKey: "isFinished")
    didChangeValue(forKey: "isExecuting")
  }
  
}

