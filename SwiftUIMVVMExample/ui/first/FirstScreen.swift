import SwiftUI

struct FirstScreen: View {
    
    @InjectViewModel private var viewModel: FirstViewModel
    @State private var albums: [String]?
    @State private var position = 0
    @State var isRefreshing = false
    
    var body: some View {
        content
            .onReceive(viewModel.$albumsResult.onMain, perform: handleAlbumsResult)
            .onAppear {
                if albums != nil { return }
                viewModel.loadAlbums()
            }
    }
    
    private var content: some View {
        VStack {
            btLoad
            btSecondScreen
            
            TabView(selection: $position) {
                list
                list
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
}

// MARK: Views
extension FirstScreen {
    
    private var list: some View {
        ScrollRefreshable(isRefreshing: $isRefreshing) {
            LazyVStack {
                ForEach(albums ?? [], id: \.self) { it in
                    VStack {
                        Button {
                            logget("1")
                        } label: {
                            Text(it)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                }
                
                Spacer()
            }
            .padding()
        }
        .onRefresh {
            viewModel.loadAlbums()
        }
    }
    
    private var btSecondScreen: some View {
        Button {
            SecondScreenRouter.open(id: "a1d8890a")
        } label: {
            Text("Second Screen")
                .padding()
        }
    }
    
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
            albums = "\(String(describing: data))".split(separator: ",")
                .map { it in
                    String(describing: it)
                }
                .filter({ it in
                    !it.isEmpty
                })
            isRefreshing = false
        case .error(let error):
            albums = [error?.localizedDescription ?? ""]
            isRefreshing = false
        default:
            break
        }
    }
}
