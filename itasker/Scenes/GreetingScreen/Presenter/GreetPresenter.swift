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
    

    func showRegistrationVC(_ root: UIViewController) {
        root.navigationController?.present(RegistrationViewController(), animated: true)
    }
    
    func showLoginVC(_ root: UIViewController) {
        root.navigationController?.present(LoginViewController(presenter: self), animated: true)
    }
    
    func showTrickyPassage(_ root: UIViewController) {
        let vc = ContainerViewController(presenter: SideMenuPresenter())
        vc.modalPresentationStyle = .fullScreen
        root.navigationController?.present(vc, animated: true)
    }
    
    
    
}

