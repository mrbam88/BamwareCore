import Foundation

public enum AppError: Error, Codable {
    case unauthorized
    case notFound
    case invalidInput(String)
    case unknown(String)
}