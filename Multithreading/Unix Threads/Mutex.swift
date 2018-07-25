import Foundation

class UnixMutex {
  private var mutex = pthread_mutex_t()
  
  init() {
    pthread_mutex_init(&mutex, nil)
  }
  
  func test() {
    pthread_mutex_lock(&mutex)
    // Do something
    print("UnixMutex test")
    pthread_mutex_unlock(&mutex)
  }
  
}

/* UnixMutex().test() */
