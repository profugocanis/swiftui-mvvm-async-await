import Foundation

struct ITunesResult: Decodable {
    let results: [Album]
}

struct Album: Decodable {
    let collectionId: Int?
    let collectionName: String?
    let collectionPrice: Double?
}
