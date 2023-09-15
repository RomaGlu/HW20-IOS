import Foundation

public struct Cards: Decodable {
    public let cards: [Card]
}

public struct Card: Decodable {
    public let name: String?
    public let manaCost: String?
    public let type: String?
    public let rarity: String?
    public let artist: String?
    public let number: String?
    public let set: String?
    public let power: String?
}
