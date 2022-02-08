import SwiftUI

struct ThirdScreen: View {
    
    @InjectViewModel<ThirdScreen, ThirdViewModel> private var viewModel
    
    var body: some View {
        Text("Third Screen")
            .onAppear {
                viewModel.load()
            }
    }
}
