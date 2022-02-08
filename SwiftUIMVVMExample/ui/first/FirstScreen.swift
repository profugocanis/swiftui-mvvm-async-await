import SwiftUI

struct FirstScreen: View {
    
    @InjectViewModel private var viewModel: FirstViewModel
    @State private var albums: String = ""
    
    var body: some View {
        content
            .onReceive(viewModel.$albumsResult, perform: handleAlbumsResult)
            .onAppear {
                viewModel.loadAlbums()
            }
    }
    
    private var content: some View {
        VStack {
            Button {
                SecondScreenRouter.open(id: "a1d8890a")
            } label: {
                Text("Second Screen")
                    .padding()
            }
            
            ScrollView {
                LazyVStack {
                    Text(albums)
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

// MARK: handles
extension FirstScreen {
    
    private func handleAlbumsResult(_ source: Source<[ITunesResult]>?) {
        switch source {
        case .success(let data):
            albums = "\(String(describing: data))"
        case .error(let error):
            albums = error?.localizedDescription ?? ""
        default:
            break
        }
    }
}
