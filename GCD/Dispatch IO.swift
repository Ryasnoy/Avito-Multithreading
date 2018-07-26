import Foundation

// For filesystem

class GCDChannelTest {
  
  private let queue = DispatchQueue(label: "GCDChannelTest", attributes: .concurrent)
  private var channel: DispatchIO? // File descriptor
  
  func test() {
    
    guard let filePath = Bundle.main.path(forResource: "test", ofType: nil) else {return}
    
    channel = DispatchIO(__type: DispatchIO.StreamType.stream.rawValue, path: filePath, oflag: O_RDONLY, mode: 0, queue: DispatchQueue.global(), handler: { error in
      // Handle Error
    })
    
    channel?.read(offset: 0, length: Int.max, queue: queue, ioHandler: { done, data, error in
      
      if data != nil {
        // Handle data
      }
      
      if error != 0 {
        // Handle error
      }
      
    })
  }
  
}
