import UIKit

class ThirdScreenRouter {
    
    static func open(id: String) {
        UINavigationController.openView(ThirdScreen(), title: "Third Screen")
    }
}
