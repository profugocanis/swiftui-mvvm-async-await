import SwiftUI

class BaseViewController<Content> : UIHostingController<Content>, ViewModelSupportProtocol where Content : View {
    
    internal var viewModels = [BaseViewModel?]()
    
    func addViewModel(_ vm: BaseViewModel?) {
        viewModels.append(vm)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if navigationController == nil {
            viewModels.forEach { $0?.onCanceled() }
        }
    }
}
