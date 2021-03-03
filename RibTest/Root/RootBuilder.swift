//
//  RootBuilder.swift
//  RibTest
//
//  Created by Pedro Clericuzi on 02/03/21.
//
import UIKit
import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootComponent: Component<RootDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    let rootViewController: RootViewController
    
    init(dependency: RootDependency,
         rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> (launchRouter: LaunchRouting, rootListener: RootListener)
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {


    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> (launchRouter: LaunchRouting, rootListener: RootListener) {
        print("passou aqui")
        let viewController = RootViewController()
        let component = RootComponent(dependency: dependency, rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController)
        //interactor.listener = listener
        let homeBuilder = HomeBuilder(dependency: component)
        return (RootRouter(interactor: interactor, viewController: viewController, homeBuildable: homeBuilder), interactor)
    }
}
