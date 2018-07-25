import Foundation

class RecursiveMutexTest {
  private var mutex = pthread_mutex_t()
  private var attr = pthread_mutexattr_t()
  
  init() {
    pthread_mutexattr_init(&attr)
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE)
    pthread_mutex_init(&mutex, &attr)
  }
  
  func test1() {
    pthread_mutex_lock(&mutex)
    test2()
    print("RecursiveMutexTest \(#function)")
    pthread_mutex_unlock(&mutex)
  }
  
  func test2() {
    pthread_mutex_lock(&mutex)
    // Do something
    print("RecursiveMutexTest \(#function)")
    pthread_mutex_unlock(&mutex)
  }
  
}

/* RecursiveMutexTest().test1() */
