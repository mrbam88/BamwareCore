import Foundation

public struct User: DomainIdentifiable, Codable {
    public let id: UserID
    public let email: String
    public let name: String?
}