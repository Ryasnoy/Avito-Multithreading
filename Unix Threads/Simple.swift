import Foundation

// Unix thread

var thread = pthread_t(bitPattern: 0)
var attribute = pthread_attr_t()

pthread_attr_init(&attribute)
pthread_create(&thread, &attribute, { pointer in
  print("Unix thread")
  return nil
}, nil)
