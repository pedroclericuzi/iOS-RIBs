//
//  RootRouter.swift
//  RibTest
//
//  Created by Pedro Clericuzi on 02/03/21.
//

import RIBs

protocol RootInteractable: Interactable, HomeListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    private let homeBuildable: HomeBuildable
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, homeBuildable: HomeBuildable) {
        self.homeBuildable = homeBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToHome() {
        let home = homeBuildable.build(withListener: interactor)
        attachChild(home)
        viewController.present(viewController: home.viewControllable)
    }
}
