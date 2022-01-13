import Foundation

class GetTestDataUseCase: BaseUseCase {
    
    private let restManager: RestManager
    
    init(restManager: RestManager) {
        self.restManager = restManager
    }
    
    func invoke() async -> Source<ITunesResult> {
        await handle {
            try await restManager.fetch(url: "http://192.168.2.234:4004/test/", method: .get)
        }
    }
}
