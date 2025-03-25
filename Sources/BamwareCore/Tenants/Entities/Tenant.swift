
public struct Tenant: Entity, Equatable, Codable, Sendable {
    public let id: String
    public let tenantID: String
    
    public init(id: String, tenantID: String) {
        self.id = id
        self.tenantID = tenantID
    }
    
    public static func == (lhs: Tenant, rhs: Tenant) -> Bool {
        return lhs.id == rhs.id && lhs.tenantID == rhs.tenantID
    }
}
