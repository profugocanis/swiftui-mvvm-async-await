import Foundation
import Alamofire

open class BaseUseCase {
    
    func handle<T: Decodable>(_ callback: () async throws -> T) async -> Source<T> {
        do {
            return .success(try await callback())
        } catch {
            return .error(error)
        }
    }
}
