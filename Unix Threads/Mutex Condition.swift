import Foundation

// Unix Mutex Condition

class MutexConditionTest {
  private var condition = pthread_cond_t()
  private var mutex = pthread_mutex_t()
  private var check = false
  
  init() {
    pthread_cond_init(&condition, nil)
    pthread_mutex_init(&mutex, nil)
  }
  
  func test1() {
    pthread_mutex_lock(&mutex)
    while !check {
      pthread_cond_wait(&condition, &mutex)
    }
    print("MutexConditionTest \(#function)")
    // Do something
    pthread_mutex_unlock(&mutex)
  }
  
  func test2() {
    pthread_mutex_lock(&mutex)
    check = true
    print("MutexConditionTest \(#function)")
    pthread_cond_signal(&condition)
    pthread_mutex_unlock(&mutex)
  }
  
}

/* MutexConditionTest().test1() */
