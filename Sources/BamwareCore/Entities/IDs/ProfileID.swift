import Foundation

public struct ProfileID: Hashable, Codable {
    public let value: UUID
    public init(_ value: UUID) { self.value = value }
}