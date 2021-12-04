//
//  VIewController.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter

    let width = UIScreen.main.bounds.width
    let heigth = UIScreen.main.bounds.height
    
    private var password = ""
    private var login = ""
    
    var onClose : (()->())?
    
    private var labels = LoginLabels()
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = labels
    }

    override func viewDidLoad() {
        
        labels.enterButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc func loginTapped() {
        password = labels.userPasswordTextField.text ?? ""
        login = labels.userLoginTextField.text ?? ""
        self.loginButtonTappedDelegate(email: login, password: password)
    }
}

extension LoginViewController {
    func loginButtonTappedDelegate(email : String, password: String) {
        print("[DEBUG] login tapped")
        presenter.login(email: email, password: password)
    }
}

extension LoginViewController: LoginPresenterOutput {
    func redirect() {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.onClose?()
        }
    }
}
