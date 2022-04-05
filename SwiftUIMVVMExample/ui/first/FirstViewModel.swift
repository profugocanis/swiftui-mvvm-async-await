import Combine
import Foundation

class FirstViewModel: BaseViewModel, ObservableObject {
    
    @Published private(set) var albumsResult: Source<[ITunesResult]>!
    
    private let getAlbumUseCase: GetAlbumUseCase
    private let ids = [1]
    
    init(getAlbumUseCase: GetAlbumUseCase) {
        self.getAlbumUseCase = getAlbumUseCase
    }
    
    func loadAlbums() {
        albumsResult = .processing
        task { [weak self] in
            self?.albumsResult = await self?.getAlbumUseCase.invoke(ids: self?.ids ?? [])
        }
    }
}
