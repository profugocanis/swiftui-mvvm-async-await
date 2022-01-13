import Foundation
import Swinject

@MainActor
class AppComponent {
    
    static let container = Container()
    
    private init() {}
    
    static func setup() {
        setupData()
        setupUseCase()
        setupViewModels()
    }
    
    private static func setupData() {
        container.register(RestManager.self) { _ in
            RestManager()
        }.inObjectScope(.container)
    }
    
    private static func setupUseCase() {
        container.register(GetAlbumUseCase.self) { r in
            GetAlbumUseCase(restManager: r.resolve(RestManager.self)!)
        }
        container.register(GetTestDataUseCase.self) { r in
            GetTestDataUseCase(restManager: r.resolve(RestManager.self)!)
        }
    }
    
    private static func setupViewModels() {
        container.register(FirstViewModel.self) { r in
            FirstViewModel(
                getAlbumUseCase: r.resolve(GetAlbumUseCase.self)!
            )
        }
        container.register(SecondViewModel.self) { r in
            SecondViewModel(
                getTestDataUseCase: r.resolve(GetTestDataUseCase.self)!
            )
        }
    }
}
