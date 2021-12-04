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
}

protocol RegistrationProtocol {
    func register(email: String, password : String)
    func isLogged() -> Bool
}

final class RegistrationPresenter: RegistrationProtocol {
    private  let auth = Auth.auth()
    weak var controller: RegistrationPresenterOutput?
    
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
            
        let hashed = password.sha256()
        auth.createUser(withEmail: email, password: hashed) { result, error in
            guard result != nil && error == nil else {
                return
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
