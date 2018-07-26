import Foundation

/* Operation Structure
 
 * - isReady
 * - isAsynchronous
 * - isExecuting
 * - isFinished
 * - isCanceled
 
 - main()
 - start()
 */


class BlockOperationTest {
  private let operationQueue = OperationQueue()
  
  func test() {
    let blockOperation = BlockOperation {
      print("test")
    }
    operationQueue.addOperation(blockOperation)
  }
}

BlockOperationTest().test()
