import Foundation

// Quality of services Unix Thread

class PthreadQosTest {
  func test() {
    var thread = pthread_t(bitPattern: 0)
    var attribute = pthread_attr_t()
    pthread_attr_init(&attribute)
    pthread_attr_set_qos_class_np(&attribute, QOS_CLASS_USER_INITIATED, 0)
    pthread_create(&thread, &attribute, { pointer in
      print("Test QoS")
      pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
      return nil
    }, nil)
  }
}

/* PthreadQosTest().test() */
