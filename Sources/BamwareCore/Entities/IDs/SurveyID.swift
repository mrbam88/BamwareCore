import Foundation

public struct SurveyID: Hashable, Codable {
    public let value: UUID
    public init(_ value: UUID) { self.value = value }
}