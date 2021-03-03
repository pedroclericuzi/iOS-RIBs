//
//  RootInteractor.swift
//  RibTest
//
//  Created by Pedro Clericuzi on 02/03/21.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToHome()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener, RootListener {
    
    weak var router: RootRouting?
    weak var listener: RootListener?
    private var viewDidAppeared = false
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        self.redirectToInitialRIB()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func viewDidAppear() {
        viewDidAppeared = true
        redirectToInitialRIB()
    }
    
    private func redirectToInitialRIB() {
        startApplication()
    }
    
    private func startApplication() {
        router?.routeToHome()
    }
    
}
