import Foundation

extension Sequence {
    
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
    
    func parallelMap<T: Decodable>(_ block: @escaping (Element) async throws -> T) async throws -> [T] {
        try await withThrowingTaskGroup(of: T.self) { group -> [T] in
            self.forEach { id in
                group.addTask {
                    try await block(id)
                }
            }
            var results = [T]()
            for try await result in group {
                results.append(result)
            }
            return results
        }
    }
}
