import Alamofire
import Foundation

private let TAG = "Rest"

class RestManager {
    
    private let session: Session
    
    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForResource = 10
        session = Alamofire.Session(configuration: configuration)
    }
    
    func fetch<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters? = nil) async throws -> Source<T> {
        let response = try await session.asyncRequest(url,
                             method: method,
                             parameters: parameters,
                             encoding: JSONEncoding.default
                         )
        return try parseResponse(response)
    }
    
    private func parseResponse<T: Decodable>(_ response: AFDataResponse<Data?>) throws -> Source<T> {
        if let error = response.error { throw error }
        do {
            if let data = response.data {
                AppLoger.d(tag: TAG, String(data: data, encoding: .utf8))
                let obj = try JSONDecoder().decode(T.self, from: data)
                return .success(obj)
            }
        } catch {
            return .error(error)
        }
        return .error(nil)
    }
}
