import Foundation

public struct FeatureFlag: Codable, Hashable {
    public let key: String
    public let isEnabled: Bool
}