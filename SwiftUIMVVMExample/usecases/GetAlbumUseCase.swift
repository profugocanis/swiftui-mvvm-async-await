import Foundation

class GetAlbumUseCase: BaseUseCase {
    
    private let restManager: RestManager
    
    init(restManager: RestManager) {
        self.restManager = restManager
    }
    
    func invoke() async -> Source<ITunesResult> {
        await handle {
            try await restManager.fetch(url: Endpoints.albums, method: .get)
        }
    }
}
