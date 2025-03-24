
import XCTest
@testable import BamwareCore

final class BamwareAuthTests: XCTestCase {
    fileprivate var permissionsService: MockUserPermissionsService!
    var sut: BamwareAuth!
    
    override func setUp() {
        super.setUp()
        permissionsService = MockUserPermissionsService()
        sut = BamwareAuth()
        sut.setPermissionsService(permissionsService)
    }
    
    func test_login_withValidCredentials_setsCurrentUser() async throws {
        let tenant = "demoTenant"
        let username = "user"
        let password = "pass"
        
        let user = try await sut.login(tenant: tenant, username: username, password: password)
        
        XCTAssertNotNil(sut.currentUser)
        XCTAssertEqual(sut.currentUser?.id, "1")
        XCTAssertEqual(sut.currentUser?.tenantID, tenant)
        XCTAssertEqual(sut.currentUser?.roles, ["\(tenant):canMessage"])
        XCTAssertEqual(user, sut.currentUser)
    }
    
    func test_logout_clearsCurrentUser() async throws {
        sut.currentUser = User(id: "1", tenantID: "demoTenant", roles: ["demoTenant:canMessage"])
        
        try await sut.logout()
        
        XCTAssertNil(sut.currentUser)
    }
    
    func test_signup_setsCurrentUser() async throws {
        let tenant = "demoTenant"
        let username = "newUser"
        let password = "pass"
        
        let user = try await sut.signup(tenant: tenant, username: username, password: password)
        
        XCTAssertNotNil(sut.currentUser)
        XCTAssertEqual(sut.currentUser?.id, "new-newUser")
        XCTAssertEqual(sut.currentUser?.tenantID, tenant)
        XCTAssertEqual(sut.currentUser?.roles, ["\(tenant):canMessage"])
        XCTAssertEqual(user, sut.currentUser)
    }
    
    func test_refreshToken_updatesCurrentUser() async throws {
        sut.currentUser = User(id: "1", tenantID: "demoTenant", roles: ["demoTenant:canMessage"])
        
        let refreshedUser = try await sut.refreshToken()
        
        XCTAssertNotNil(sut.currentUser)
        XCTAssertEqual(sut.currentUser?.id, "1")
        XCTAssertEqual(sut.currentUser?.tenantID, "demoTenant")
        XCTAssertEqual(sut.currentUser?.roles, ["demoTenant:canMessage"])
        XCTAssertEqual(refreshedUser, sut.currentUser)
    }
    
    func test_tenant_returnsTenant() async throws {
        let tenantID = "demoTenant"
        
        let tenant = try await sut.tenant(id: tenantID)
        
        XCTAssertEqual(tenant.id, tenantID)
        XCTAssertEqual(tenant.tenantID, tenantID)
    }
}

private class MockUserPermissionsService: UserPermissionsService {
    public func hasPermission(_ permission: String, tenantID: String) -> Bool {
        return true  // Mock—always allow
    }
}
