// ~/c/bamw/bamware-swiftui/BamwareCore/Sources/BamwareCore/Auth/Services/BamwareAuth.swift
public class BamwareAuth: AuthService {
    public var currentUser: User?
    private var permissionsService: UserPermissionsService?
    
    public init() {}
    
    public func setPermissionsService(_ service: UserPermissionsService) {
        self.permissionsService = service
    }
    
    public func login(tenant: String, username: String, password: String) async throws -> User {
        let user = User(id: "1", tenantID: tenant, roles: ["\(tenant):canMessage"])
        self.currentUser = user
        print("BamwareAuth login set currentUser: \(String(describing: self.currentUser))")
        return user
    }
    
    public func logout() async throws {
        self.currentUser = nil
    }
    
    public func signup(tenant: String, username: String, password: String) async throws -> User {
        let user = User(id: "new-\(username)", tenantID: tenant, roles: ["\(tenant):canMessage"])
        self.currentUser = user
        return user
    }
    
    public func refreshToken() async throws -> User {
        guard let user = currentUser else { throw AuthError.noCurrentUser }
        let refreshedUser = User(id: user.id, tenantID: user.tenantID, roles: user.roles)
        self.currentUser = refreshedUser
        return refreshedUser
    }
    
    public func tenant(id: String) async throws -> Tenant {
        return Tenant(id: id, tenantID: id)
    }
}

private enum AuthError: Error {
    case noCurrentUser
}
