import Foundation

public struct Tenant: DomainIdentifiable, Codable {
    public let id: TenantID
    public let name: String
    public let slug: String
}