import RIBs

/// The dependencies needed from the parent scope of Root to provide for the LoggedOut scope.
// Update RootDependency protocol to inherit this protocol.
protocol RootDependencyLoggedOut: Dependency {
    // Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the LoggedOut scope.
}

extension RootComponent: HomeDependency {
    // Implement properties to provide for LoggedOut scope.
}
