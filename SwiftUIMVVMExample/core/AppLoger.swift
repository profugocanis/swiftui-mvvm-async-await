import Foundation

func logget(_ data: Any?) {
    print("ijk_ \(data ?? "nil")")
}

class AppLoger {
    
    static func d(tag: String, _ data: Any?) {
        print("\(tag) \(data ?? "nil")")
    }
}
