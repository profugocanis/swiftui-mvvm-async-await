import Foundation

class BaseViewModel {
    
    private var tasks = [Task<(), Never>]()
    
    func task(_ operation: @escaping () async -> Void) {
        let t = Task(priority: .high) {
            await operation()
        }
        tasks.append(t)
    }
    
    func onCanceled() {
        tasks.forEach { $0.cancel() }
    }
}
