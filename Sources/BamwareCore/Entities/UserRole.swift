import Foundation

public enum UserRole: String, Codable, CaseIterable {
    case user
    case admin
    case moderator
    case guest
    case superAdmin
}