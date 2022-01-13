import UIKit

class SecondScreenRouter {
    
    static func open(id: String) {
        UINavigationController.openView(SecondScreen(id: id), title: "Second Screen")
    }
}
