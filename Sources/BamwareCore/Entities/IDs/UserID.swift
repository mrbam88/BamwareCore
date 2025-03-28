import Foundation

public struct UserID: Hashable, Codable {
    public let value: UUID
    public init(_ value: UUID) { self.value = value }
}