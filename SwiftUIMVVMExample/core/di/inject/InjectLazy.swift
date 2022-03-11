import Foundation

@propertyWrapper
public class InjectLazy<T> {

    private var instance: T?

    public var wrappedValue: T {
            if instance == nil {
                instance = appContainer.resolve(T.self)
            }
            return instance!
    }

    public init() {}
}
