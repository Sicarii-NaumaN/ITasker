//
//  greetPresenter.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 30.10.2021.
//

import UIKit

protocol GreetPresenterProtocol {
    func showRegistrationVC(_ root: UIViewController)
    func showLoginVC(_ root: UIViewController)
    func showTrickyPassage(_ root: UIViewController)
}

final class GreetPresenter: GreetPresenterProtocol {
    weak var controller : GreetViewControler?

    func showRegistrationVC(_ root: UIViewController) {
        let presenter = RegistrationPresenter()
        let vc = RegistrationViewController(presenter: presenter)
        presenter.controller = vc
        vc.onClose = { [weak self] in
            guard let self = self else { return }
            if let controller = self.controller {
                self.showTrickyPassage(controller)
            }
        }
        
        root.navigationController?.present(vc, animated: true)
    }
    
    func showLoginVC(_ root: UIViewController) {
        let presenter = LoginPresenter()
        let vc = LoginViewController(presenter: presenter)
        presenter.controller = vc
        vc.onClose = { [weak self] in
            guard let self = self else { return }
            if let controller = self.controller {
                self.showTrickyPassage(controller)
            }
        }
        root.navigationController?.present(vc, animated: true)
    }
    
    func showTrickyPassage(_ root: UIViewController) {
        let vc = ContainerViewController(presenter: SideMenuPresenter())
        vc.modalPresentationStyle = .fullScreen
        root.navigationController?.present(vc, animated: true)
    }
    
    
    
}

