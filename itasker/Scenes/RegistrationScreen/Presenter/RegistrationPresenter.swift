//
//  RegistrationPresenter.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit
import Firebase

protocol RegistrationPresenterOutput: AnyObject {
    func redirect()
    func logAlert(error: String)
}

protocol RegistrationProtocol {
    func register(email: String, password : String)
    func isLogged() -> Bool
}

final class RegistrationPresenter: RegistrationProtocol {
    private  let auth = Auth.auth()
    weak var controller: RegistrationPresenterOutput?
    
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

    func register(email: String, password : String) {
        if password.isEmpty || email.isEmpty {
            print("[DEBUG] \(#function) empty input")
            return
        }
        
        if password.count < 6 {
            self.logError = "Минимальная длина пароля 6 симолов"
        }
            
        let hashed = password.sha256()
        auth.createUser(withEmail: email, password: hashed) { result, error in
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed:
                    debugPrint("Error: operationNotAllowed")
                    DispatchQueue.main.async {
                        self.logError = "Нет прав"
                    }
                case .invalidEmail:
                    debugPrint("Error: invalidEmail")
                    DispatchQueue.main.async {
                        self.logError = "Некорректный email"
                    }
                case .emailAlreadyInUse:
                    debugPrint("Error: invalidEmail")
                    DispatchQueue.main.async {
                        self.logError = "Такой пользователю уже существует"
                    }
                  // Error: Indicates the email address is malformed.
                default:
                    DispatchQueue.main.async {
                        self.logError = "Ошибка с сервером"
                    }
                    print("Error: \(error.localizedDescription)")
                }
              } else {
        
                DispatchQueue.main.async {
                    self.logged = true
                }
            }
        }
        DispatchQueue.main.async {
            self.logged = true
        }
    }
    
    
    func isLogged() -> Bool {
        return logged
    }
}
