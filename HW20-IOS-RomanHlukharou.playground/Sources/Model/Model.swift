import Foundation

public struct Cards: Decodable {
    public let cards: [Card]
}

public struct Card: Decodable {
    public let name: String
    public let type: String
    public let text: String
    public let rarity: String
    public let set: String
}
