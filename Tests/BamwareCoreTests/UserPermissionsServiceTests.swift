
import XCTest
@testable import BamwareCore

final class UserPermissionsServiceTests: XCTestCase {
    func test_hasPermission_returnsTrueForRole() {
        let user = User(id: "1", tenantID: "bamSocial", roles: ["bamSocial:canMessage"])
        let authService = MockAuthService(currentUser: user)
        let sut = DefaultUserPermissionsService(authService: authService)
        
        let hasPerm = sut.hasPermission("canMessage", tenantID: "bamSocial")
        
        XCTAssertTrue(hasPerm)
    }
    
    func test_hasPermission_returnsFalseForMissingRole() {
        let user = User(id: "1", tenantID: "bamSocial", roles: ["bamSocial:canView"])
        let authService = MockAuthService(currentUser: user)
        let sut = DefaultUserPermissionsService(authService: authService)
        
        let hasPerm = sut.hasPermission("canMessage", tenantID: "bamSocial")
        
        XCTAssertFalse(hasPerm)
    }
    
    func test_hasPermission_noUser_returnsFalse() {
        let authService = MockAuthService(currentUser: nil)
        let sut = DefaultUserPermissionsService(authService: authService)
        
        let hasPerm = sut.hasPermission("canMessage", tenantID: "bamSocial")
        
        XCTAssertFalse(hasPerm)
    }
}

private class MockAuthService: AuthService {
    var currentUser: User?
    
    init(currentUser: User?) {
        self.currentUser = currentUser
    }
    
    func login(tenant: String, username: String, password: String) async throws -> User {
        fatalError("Not implemented")
    }
    
    func logout() async throws {}
    
    func signup(tenant: String, username: String, password: String) async throws -> User {
        fatalError("Not implemented")
    }
    
    func refreshToken() async throws -> User {
        fatalError("Not implemented")
    }
    
    func tenant(id: String) async throws -> Tenant {
        fatalError("Not implemented")
    }
}
