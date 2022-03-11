import Foundation
import Swinject

public func factory<T: AnyObject>(_ create: @escaping (Resolver) -> T) {
    appContainer.register(T.self) { r in
        create(r)
    }
}

public func singelton<T: AnyObject>(_ create: @escaping (Resolver) -> T) {
    appContainer.register(T.self) { r in
        create(r)
    }.inObjectScope(.container)
}

extension Resolver {
    
    func get<T>() -> T? {
        resolve(T.self)
    }
}
