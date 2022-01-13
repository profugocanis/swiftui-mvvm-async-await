import SwiftUI

extension UINavigationController {
    
    static func openView<T: View>(_ view: T, title: String = "") {
        guard let nvc = UIApplication.shared.window?.rootViewController as? UINavigationController else { return }
        let vc = BaseViewController(rootView: view)
        vc.title = title
        nvc.pushViewController(vc, animated: true)
    }
}
