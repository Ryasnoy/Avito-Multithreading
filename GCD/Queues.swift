import Foundation

// There are two types of Queues:
// - Serial - sync
// - Concurrent - async

class QueueTest1 {
  private let serialQueue = DispatchQueue(label: "serialTest")
  private let concurrentQueue = DispatchQueue(label: "concurrentTest", attributes: .concurrent)
}

// Get queue from pull of queues
// - Global
// - Main

class QueueTest2 {
  /*
   Default: Concurrent
   */
  private let globalQueue = DispatchQueue.global()
  /*
   Exception: Serial Global Queue on the main
   */
  private let mainQueue = DispatchQueue.main
}


