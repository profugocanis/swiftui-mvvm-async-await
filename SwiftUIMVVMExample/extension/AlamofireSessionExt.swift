import Alamofire
import Foundation

extension Alamofire.Session {
    
    func asyncRequest(
        _ convertible: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil,
        requestModifier: RequestModifier? = nil
    ) async throws -> AFDataResponse<Data?> {
        
        let r = request(convertible, method: method, parameters: parameters, encoding: encoding, headers: headers, interceptor: interceptor, requestModifier: requestModifier)
        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation({ continuation in
                r.response { continuation.resume(returning: $0) }
            })
        } onCancel: {
            r.cancel()
        }
    }
}
