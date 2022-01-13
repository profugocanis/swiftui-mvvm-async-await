import Foundation
import Alamofire

open class BaseUseCase {
    
    func handle<T: Decodable>(_ callback: () async throws -> Source<T>) async -> Source<T> {
        do {
            return try await callback()
        } catch {
            return .error(error)
        }
    }
}
