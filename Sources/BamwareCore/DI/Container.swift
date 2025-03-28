import Foundation

public final class Container {
    public static let shared = Container()
    private init() {}

    private var factories: [ObjectIdentifier: () -> Any] = [:]
    private var instances: [ObjectIdentifier: Any] = [:]

    public func register<T>(_ factory: @escaping () -> T) {
        factories[ObjectIdentifier(T.self)] = factory
    }

    public func resolve<T>() -> T {
        let key = ObjectIdentifier(T.self)
        if let instance = instances[key] as? T {
            return instance
        }
        guard let factory = factories[key]?() as? T else {
            fatalError("No factory for \(T.self)")
        }
        instances[key] = factory
        return factory
    }
}

extension Container {
    public func resolve<T>(_ type: T.Type) -> T {
        resolve()
    }
}
