import SwiftUI

@propertyWrapper
class InjectViewModel<ScopeContent: View, T: BaseViewModel> {
    
    private var instance: T?
    private var arguments: (() -> Any?)?
    
    var wrappedValue: T {
        if instance == nil {
            instance = AppComponent.container.resolve(T.self)
        }
        if instance == nil {
            fatalError("\(T.self) nil state")
        }
        Self.setupViewModel(instance)
        return instance!
    }
}
 
extension InjectViewModel {
    
    static func setupViewModel(_ vm: BaseViewModel?) {
        let navigationVC = UIApplication.shared.window?.rootViewController as? UINavigationController
        let vc = navigationVC?.viewControllers.first(where: { $0 is BaseViewController<ScopeContent> }) as? BaseViewController<ScopeContent>
        if vc == nil {
            fatalError("inject - \(T.self) wrong view - \(ScopeContent.self)")
        }
        vc?.viewModels.append(vm)
    }
    
    static func getViewModel<T: BaseViewModel>(_ args: Any?) -> T {
        let instance = AppComponent.container.resolve(T.self)
        InjectViewModel<ScopeContent, T>.setupViewModel(instance)
        return instance!
    }
}
