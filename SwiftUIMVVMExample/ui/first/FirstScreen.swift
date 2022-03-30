import SwiftUI

struct FirstScreen: View {
    
    @InjectViewModel private var viewModel: FirstViewModel
    @State private var albums: String = ""
    
    var body: some View {
        content
            .onReceive(viewModel.$albumsResult.onMain, perform: handleAlbumsResult)
            .onAppear {
                viewModel.loadAlbums()
            }
    }
    
    private var content: some View {
        VStack {
            btLoad
            
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

extension FirstScreen {
    
    private var btLoad: some View {
        Button {
            viewModel.loadAlbums()
        } label: {
            Text("Load")
                .padding()
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
