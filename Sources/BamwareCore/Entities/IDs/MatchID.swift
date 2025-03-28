import Foundation

public struct MatchID: Hashable, Codable {
    public let value: UUID
    public init(_ value: UUID) { self.value = value }
}