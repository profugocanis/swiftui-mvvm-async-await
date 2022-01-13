import Combine

class FirstViewModel: BaseViewModel, ObservableObject {
    
    @Published private(set) var albumsResult: Source<ITunesResult>!
    
    private let getAlbumUseCase: GetAlbumUseCase
    
    init(getAlbumUseCase: GetAlbumUseCase) {
        self.getAlbumUseCase = getAlbumUseCase
    }
    
    func loadAlbums() {
        task { [weak self] in
            self?.albumsResult = await self?.getAlbumUseCase.invoke()
        }
    }
}
