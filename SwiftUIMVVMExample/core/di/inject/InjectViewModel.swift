import SwiftUI

@propertyWrapper
class InjectViewModel<ScopeContent: View, T: BaseViewModel> {
    
    private var instance: T?
    private var arguments: (() -> Any?)?
    
    var wrappedValue: T {
        if instance == nil {
            instance = AppComponent.container.resolve(T.self)
            Self.setupViewModel(instance)
        }
        if instance == nil {
            #if DEBUG
            fatalError("\(T.self) nil state")
            #endif
        }
        return instance!
    }
}
 
extension InjectViewModel {
    
    static func setupViewModel(_ vm: BaseViewModel?) {
        let window = UIApplication.shared.window
        if var topVC = window?.rootViewController {
            while let presentedViewController = topVC.presentedViewController {
                topVC = presentedViewController
            }
            
            if let nvc = topVC as? UINavigationController {
                setupVC(vc: nvc.viewControllers.last, vm: vm)
            } else {
                setupVC(vc: topVC, vm: vm)
            }
        }
    }
    
    static func setupVC(vc: UIViewController?, vm: BaseViewModel?) {
        guard let topVC = vc as? BaseViewController<ScopeContent> else {
            #if DEBUG
            fatalError("inject - \(T.self) wrong view - \(ScopeContent.self)")
            #endif
        }
        topVC.viewModels.append(vm)
    }
    
    static func getViewModel<T: BaseViewModel>(_ args: Any?) -> T {
        let instance = AppComponent.container.resolve(T.self)
        InjectViewModel<ScopeContent, T>.setupViewModel(instance)
        return instance!
    }
}
