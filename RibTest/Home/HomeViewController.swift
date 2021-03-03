//
//  HomeViewController.swift
//  RibTest
//
//  Created by Pedro Clericuzi on 02/03/21.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {
    
    var listener: HomePresentableListener?
    private var targetViewController: ViewControllable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //versionLabel.text = "v\(AppData.appVersion) \(AppData.env)"
        //self.view.backgroundColor = "red"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - RootViewControllable
    func present(viewController: ViewControllable?) {
        self.targetViewController = viewController
        if presentedViewController != nil {
            dismiss(animated: true) { [weak self] in
                guard let this = self else { return }
                if this.targetViewController != nil {
                    this.presentTargetViewController()
                } else {
                    print("nada")
                }
            }
        } else {
            presentTargetViewController()
        }
    }
    
    private func presentTargetViewController() {
        if let targetViewController = targetViewController {
            print("entrou aqui")
            targetViewController.uiviewController.modalPresentationStyle = .fullScreen
            present(targetViewController.uiviewController, animated: false)
        }
    }
    
}
