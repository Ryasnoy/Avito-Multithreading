import Foundation

// Pseudo Code

class AtomicOperationsPSTest {
  func compareAndSwap(old: Int, new: Int, value: UnsafeMutablePointer<Int>) -> Bool {
    if value.pointee == old {
      value.pointee = new
      return true
    }
    return false
  }
  
  func atomicAdd(amount: Int, value: UnsafeMutablePointer<Int>) -> Int {
    var success = false
    var new = 0
    
    while !success {
      let original = value.pointee
      new = original + amount
      success = compareAndSwap(old: original, new: new, value: value)
    }
    
    return new
  }
  
}

// Deprecated
@available(iOS, deprecated: 10.0, message: "Use atomic_compare_exchange_strong() from <stdatomic.h> instead")
class AtomicOperationsTest {
  private var i: Int64 = 0
  
  func test() {
    OSAtomicCompareAndSwap64Barrier(i, 10, &i)
    OSAtomicAdd64Barrier(20, &i)
    OSAtomicIncrement64Barrier(&i)
  }
  
}
