import SwiftUI

struct ThirdScreen: View {
    
    @InjectViewModel private var viewModel: ThirdViewModel
    
    var body: some View {
        Text("Third Screen")
            .onAppear {
                viewModel.load()
            }
    }
}
