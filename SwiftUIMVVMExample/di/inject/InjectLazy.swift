import Foundation

@propertyWrapper
public class InjectLazy<T> {

    private var instance: T?

    public var wrappedValue: T {
            if instance == nil {
                instance = AppComponent.container.resolve(T.self)
            }
            return instance!
    }

    public init() {}
}
