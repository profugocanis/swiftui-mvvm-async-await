import Foundation
import Combine

class SecondViewModel: BaseViewModel, ObservableObject {
    
    @Published private(set) var testData: Source<ITunesResult>?
    
    private let getTestDataUseCase: GetTestDataUseCase
    
    init(getTestDataUseCase: GetTestDataUseCase) {
        self.getTestDataUseCase = getTestDataUseCase
    }
    
    @MainActor
    func loadTestData() {
        task { [weak self] in
            self?.testData = await self?.getTestDataUseCase.invoke()
        }
    }
    
    deinit {
        logget("SecondViewModel deinit")
    }
}
