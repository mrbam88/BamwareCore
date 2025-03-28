import Foundation

public struct TenantID: Hashable, Codable {
    public let value: String
    public init(_ value: String) { self.value = value }
}