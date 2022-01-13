import SwiftUI

@main
struct AppDelegateUI: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    let window = UIApplication.shared.window
                    
                    let mainViewController = BaseViewController(rootView: FirstScreen())
                    mainViewController.title = "First Screen"
                    
                    let mainNavigationController = UINavigationController()
                    mainNavigationController.viewControllers = [mainViewController]
                    window?.rootViewController = mainNavigationController
                    window?.makeKeyAndVisible()
                }
        }
    }
}

// MARK: AppDelegate
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppComponent.setup()
        return true
    }
}
