
public protocol UserPermissionsService {
    func hasPermission(_ permission: String, tenantID: String) -> Bool
}
