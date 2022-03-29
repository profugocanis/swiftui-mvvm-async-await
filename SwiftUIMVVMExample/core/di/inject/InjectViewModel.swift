import SwiftUI

@propertyWrapper
class InjectViewModel<T: BaseViewModel> {
    
    private var instance: T?
    
    var wrappedValue: T {
        if instance == nil {
            instance = appContainer.resolve(T.self)
            Self.setupViewModel(instance)
        }
        if instance == nil {
            fatalError("\(T.self) nil state")
        }
        return instance!
    }
}
 
extension InjectViewModel {
    
    static func getViewModel<T: BaseViewModel>(_ args: Any?) -> T {
        let instance = appContainer.resolve(T.self)
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
        guard let viewModel = vm else { return }
        guard let viewController = vc as? SupportViewModelProtocol else { return }
        viewController.addViewModel(viewModel)
    }
}
