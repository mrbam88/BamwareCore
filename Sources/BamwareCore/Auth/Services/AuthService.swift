
public protocol AuthService {
    var currentUser: User? { get }
    
    func login(tenant: String, username: String, password: String) async throws -> User
    func logout() async throws
    func signup(tenant: String, username: String, password: String) async throws -> User
    func refreshToken() async throws -> User
    func tenant(id: String) async throws -> Tenant
}
