public struct User: Entity, Equatable, Codable, Sendable {
    public let id: String
    public let tenantID: String
    public let roles: [String]
    
    public init(id: String, tenantID: String, roles: [String]) {
        self.id = id
        self.tenantID = tenantID
        self.roles = roles
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
               lhs.tenantID == rhs.tenantID &&
               lhs.roles == rhs.roles
    }
}
