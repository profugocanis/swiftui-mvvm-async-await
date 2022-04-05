import Foundation
import Combine

extension Published.Publisher {
    
    var onMain: Publishers.ReceiveOn<Published<Value>.Publisher, RunLoop> {
        get { receive(on: RunLoop.main) }
    }
}
