import Foundation

public struct MessageID: Hashable, Codable {
    public let value: UUID
    public init(_ value: UUID) { self.value = value }
}