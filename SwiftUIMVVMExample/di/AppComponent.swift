import Foundation
import Swinject

class AppComponent {
    
    static let container = Container()
    
    private init() {}
    
    static func setup() {
        setupData()
        setupUseCase()
        setupViewModels()
    }
    
    private static func setupData() {
        singelton { _ in RestManager() }
    }
    
    private static func setupUseCase() {
        factory { GetAlbumUseCase(restManager: $0.get()!) }
        factory { GetTestDataUseCase(restManager: $0.get()!) }
    }
    
    private static func setupViewModels() {
        factory {
            FirstViewModel(
                getAlbumUseCase: $0.get()!
            )
        }
        factory {
            SecondViewModel(
                getTestDataUseCase: $0.get()!
            )
        }
        factory { _ in 
            ThirdViewModel()
        }
    }
}
