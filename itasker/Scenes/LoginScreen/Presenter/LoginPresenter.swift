//
//  LoginPresenter.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit

protocol LoginPresenterProtocol {
    func showRegistrationVC(_ root: UIViewController)
}

final class LoginPresenter: LoginPresenterProtocol {

    func showRegistrationVC(_ root: UIViewController) {
        root.navigationController?.present(RegistrationViewController(), animated: true)
    }
}
