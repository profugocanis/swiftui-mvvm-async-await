import UIKit

extension UIApplication {
    
    var window: UIWindow? {
        let windowScene = connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first
    }
}
