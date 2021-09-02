/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Singleton
 - - - - - - - - - -
 ![Singleton Diagram](Singleton_Diagram.png)
 
 The singleton pattern restricts a class to have only _one_ instance.
 
 The "singleton plus" pattern is also common, which provides a "shared" singleton instance, but it also allows other instances to be created too.
 
 ## Code Example
 */
import UIKit

let app = UIApplication.shared

public class MySingleton {
  static let shared = MySingleton()
  
  private init() {}
}

let mySingleton = MySingleton.shared

public class MySingletonPlus {
  // 1
  static let shared = MySingletonPlus()
  // 2
  public init() {}
}
// 3
let singletonPlus = MySingletonPlus.shared

// 4
let singletonPlus2 = MySingletonPlus()
