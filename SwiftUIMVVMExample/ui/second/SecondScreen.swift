import SwiftUI

struct SecondScreen: View {
    
    let id: String
    @InjectViewModel<SecondScreen, SecondViewModel> private var viewModel
    @State private var text = ""
    
    var body: some View {
        content
            .onReceive(viewModel.$testData, perform: handleTestData)
            .onAppear {
                viewModel.loadTestData()
            }
    }
    
    private var content: some View {
        VStack {
            Text("Data: \(text)")
        }
        .padding()
    }
}

// MARK: handles
extension SecondScreen {
    
    private func handleTestData(_ source: Source<ITunesResult>?) {
        switch source {
        case .success(let data):
            text = "\(String(describing: data))"
        case .error(let error):
            text = error?.localizedDescription ?? ""
        default:
            break
        }
    }
}

// MARK: open
extension SecondScreen {
    
    static func open(id: String) {
        UINavigationController.openView(SecondScreen(id: id), title: "Second Screen")
    }
}
