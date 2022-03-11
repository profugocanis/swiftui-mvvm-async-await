import SwiftUI

class BaseViewController<Content> : UIHostingController<AnyView>, SupportViewModelProtocol where Content : View {
    
    internal var viewModels = [BaseViewModel?]()
    
    init(rootView: Content) {
        let view = rootView.environment(\.layoutDirection, .leftToRight)
        super.init(rootView: AnyView(view))
    }
    
    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViewModel(_ vm: BaseViewModel?) {
        viewModels.append(vm)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if navigationController == nil {
            viewModels.forEach { $0?.onCanceled() }
            viewModels.removeAll()
        }
    }
}
