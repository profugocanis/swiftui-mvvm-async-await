import SwiftUI

struct ScrollRefreshable<Content: View>: View {
    
    var content: Content
    private var parameters = Parameters()
    
    init(content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        List {
            content
                .listRowSeparatorTint(.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .refreshable {
            (parameters.onRefresh ?? {})()
        }
    }
    
    func onRefresh(_ onRefresh: @escaping () -> Void) -> ScrollRefreshable {
        self.parameters.onRefresh = onRefresh
        return self
    }
    
    private class Parameters {
        
        var onRefresh: (() -> Void)?
    }
}
