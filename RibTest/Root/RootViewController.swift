//
//  RootViewController.swift
//  RibTest
//
//  Created by Pedro Clericuzi on 02/03/21.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func viewDidAppear()
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    private var targetViewController: ViewControllable?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.listener?.viewDidAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - RootViewControllable
    
    func present(viewController: ViewControllable) {
        
        self.targetViewController = viewController
        self.presentTargetViewController()
    }
    
    private func presentTargetViewController() {
        if let targetViewController = targetViewController {
            print("entrou aqui")
            targetViewController.uiviewController.modalPresentationStyle = .fullScreen
            present(targetViewController.uiviewController, animated: true)
        }
    }
}
