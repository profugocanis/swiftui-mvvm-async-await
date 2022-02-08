import SwiftUI

struct SecondScreen: View {
    
    let id: String
    @InjectViewModel private var viewModel: SecondViewModel
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
            Button {
                ThirdScreenRouter.open(id: "123")
            } label: {
                Text("Third Screen")
                    .padding()
            }
            Text("Data: \(text)")
            
            Spacer()
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
