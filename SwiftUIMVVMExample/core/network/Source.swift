import Foundation

enum Source<T> {
    case success(_ data: T?)
    case error(_ error: Error?)
    case processing
    
    var successObject: T? {
        switch self {
        case .success(let obj):
            return obj
        default: return nil
        }
    }
}
