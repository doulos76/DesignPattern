import Foundation

@objcMembers public class KVOUser: NSObject {
  dynamic var name: String
  
  public init(name: String) {
    self.name = name
  }
}

print("-- KVO Example --")

let kvoUser = KVOUser(name: "Ray")

var kvoObserveer: NSKeyValueObservation? = kvoUser.observe(\.name, options: [.initial, .new], changeHandler: { (user, change) in
  print("User's name is \(user.name)")
})
