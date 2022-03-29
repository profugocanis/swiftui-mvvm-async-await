import Combine

class FirstViewModel: BaseViewModel, ObservableObject {
    
    @Published private(set) var albumsResult: Source<[ITunesResult]>!
    
    private let getAlbumUseCase: GetAlbumUseCase
    private let ids = [1, 2, 3]
    
    init(getAlbumUseCase: GetAlbumUseCase) {
        self.getAlbumUseCase = getAlbumUseCase
    }
    
    func loadAlbums() {
        task { [weak self] in
            self?.albumsResult = await self?.getAlbumUseCase.invoke(ids: self?.ids ?? [])
        }
    }
}
