import Foundation
import Combine

extension Publisher {

    var onMain: AnyPublisher<Output, Failure> {
        get { receive(on: RunLoop.main).eraseToAnyPublisher() }
    }
}
