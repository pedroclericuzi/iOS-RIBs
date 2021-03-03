//
//  HomeRouter.swift
//  RibTest
//
//  Created by Pedro Clericuzi on 02/03/21.
//

import RIBs

protocol HomeInteractable: Interactable {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable?)
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {
    private var child: ViewableRouting!
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: HomeInteractable, viewController: HomeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func dismissRegister() {
        dimissCurrentChild()
    }
    
    private func dimissCurrentChild() {
        if let child = child {
            detachChild(child)
            self.child = nil
            viewController.present(viewController: nil)
        }
    }
    
    private func presentChild(_ newChild: ViewableRouting) {
        self.child = newChild
        attachChild(newChild)
        newChild.viewControllable.uiviewController.modalPresentationStyle = .fullScreen
        viewController.present(viewController: newChild.viewControllable)
    }
}
