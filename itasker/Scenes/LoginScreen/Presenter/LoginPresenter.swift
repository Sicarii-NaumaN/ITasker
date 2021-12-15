//
//  LoginPresenter.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit
import Firebase

protocol LoginPresenterOutput: AnyObject {
    func redirect()
    func logAlert(error: String)
}

protocol LoginProtocol {
    func login(email: String, password : String)    
    func isLogged() -> Bool
}

final class LoginPresenter: LoginProtocol {
    private  let auth = Auth.auth()
    weak var controller: LoginPresenterOutput?
    
    var logError = "" {
        didSet {
            if logError != "" {
                self.controller?.logAlert(error: logError)
            }
        }
    }
    
    var logged = false {
        didSet {
            if logged {
                self.controller?.redirect()
            }
        }
    }
    
    func login(email: String, password : String) {
        if password.isEmpty || email.isEmpty {
            debugPrint("[DEBUG] \(#function) empty input")
            return
        }
        
        let hashed = password.sha256()
        auth.signIn(withEmail: email, password: hashed) { result, error in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    debugPrint("Error: operationNotAllowed")
                    DispatchQueue.main.async {
                        self.logError = "Нет прав"
                    }
                  // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
                case .userDisabled:
                    debugPrint("Error: userDisabled")
                    DispatchQueue.main.async {
                        self.logError = "Такого пользователя не существует"
                    }
                  // Error: The user account has been disabled by an administrator.
                case .wrongPassword:
                    debugPrint("Error: wrongPassword")
                    DispatchQueue.main.async {
                        self.logError = "Неправильный пароль"
                    }
                  // Error: The password is invalid or the user does not have a password.
                case .userNotFound:
                    debugPrint("Error: invalidEmail")
                    DispatchQueue.main.async {
                        self.logError = "Такого пользователя не существует"
                    }
                case .invalidEmail:
                    debugPrint("Error: invalidEmail")
                    DispatchQueue.main.async {
                        self.logError = "Некорректный email"
                    }
                  // Error: Indicates the email address is malformed.
                default:
                    DispatchQueue.main.async {
                        self.logError = "Неверный пароль или почта"
                    }
                    print("Error: \(error.localizedDescription)")
                }
              } else {
        
                DispatchQueue.main.async {
                    self.logged = true
                }
            }
        }
    }
    
    func isLogged() -> Bool {
        return logged
    }
}

