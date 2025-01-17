import Foundation

public enum SwiftDI {
    
    /// Defaults settings for you DI
    public enum Defaults {
        /// Set life time for you instantces. By default is `DILifeCycle.objectGraph`
        public static var lifeCycle = DILifeCycle.objectGraph
    }
    
    internal private(set) static var sharedContainer: DIContainerConvertible = DIContainer()
    
    /// Use container for inject dependencies using `@Injectable` and `@InjecatableObjectBinding`.
    /// Call method `didConnectToSwiftDI` when container passed to method. Initialize your singletons here.
    public static func useContainer(_ container: DIContainerConvertible) {
        self.sharedContainer = container
        container.didConnectToSwiftDI()
    }
}

public enum DILifeCycle {
    /// Dependency is created one per container.
    case single
    
    /// Dependency instance is created each time.
    case prototype
    
    /// Dependency is created one per container, but destory when dependency object will deinit.
    case weakSingle
    
    /// Dependency instance is created one per object graph.
    case objectGraph
}
