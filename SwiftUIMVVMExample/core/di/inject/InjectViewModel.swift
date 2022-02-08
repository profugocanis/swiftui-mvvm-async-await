import SwiftUI

@propertyWrapper
class InjectViewModel<T: BaseViewModel> {
    
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
    
    static func getViewModel<T: BaseViewModel>(_ args: Any?) -> T {
        let instance = AppComponent.container.resolve(T.self)
        setupViewModel(instance)
        return instance!
    }
    
    static private func setupViewModel(_ vm: BaseViewModel?) {
        if var topVC = UIApplication.shared.window?.rootViewController {
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
    
    static private func setupVC(vc: UIViewController?, vm: BaseViewModel?) {
        guard let topVC = vc as? ViewModelSupportProtocol else { return }
        topVC.addViewModel(vm)
    }
}
