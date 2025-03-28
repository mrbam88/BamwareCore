import Foundation

public protocol DomainIdentifiable: Hashable, Identifiable where ID: Hashable {
    var id: ID { get }
}