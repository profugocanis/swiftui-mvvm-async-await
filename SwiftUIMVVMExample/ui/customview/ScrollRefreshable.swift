import SwiftUI

struct ScrollRefreshable<Content: View>: View {
    
    var content: Content
    @Binding var isRefreshing: Bool
    private var parameters = Parameters()
    
    init(isRefreshing: Binding<Bool> = .constant(false), content: @escaping () -> Content) {
        self._isRefreshing = isRefreshing
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
            isRefreshing = true
            await pause()
        }
    }
    
    func pause() async {
        while isRefreshing {
            try? await Task.sleep(nanoseconds: 1_000_000)
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
