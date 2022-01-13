import UIKit
import SwiftUI

class BaseViewController<Content> : UIHostingController<Content> where Content : View {
    
    var viewModels = [BaseViewModel?]()
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if navigationController == nil {
            viewModels.forEach { $0?.onCanceled() }
        }
    }
}
