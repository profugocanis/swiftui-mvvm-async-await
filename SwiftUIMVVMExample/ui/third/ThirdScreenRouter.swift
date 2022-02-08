import UIKit

class ThirdScreenRouter {
    
    static func open(id: String) {
        UINavigationController.presentView(ThirdScreen())
    }
}
