//
//  RegistrationViewController.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit

class RegistrationViewController: UIViewController,
                                  UITextFieldDelegate, UITextViewDelegate {
    
    let width = UIScreen.main.bounds.width
    let heigth = UIScreen.main.bounds.height
    private let presenter: RegistrationPresenter
    
    var onClose : (()->())?
   
    private var login = ""
    private var password = ""
    
    private var labels = RegistrationLabels()

    init(presenter: RegistrationPresenter) {
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
        labels.regButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @objc func registerTapped() {
        password = labels.userPasswordTextField.text ?? ""
        login = labels.userLoginTextField.text ?? ""
        self.registerButtonTappedDelegate(email: login, password: password)
    }
}

extension RegistrationViewController {
    func registerButtonTappedDelegate(email : String, password: String) {
        print("[DEBUG] register tapped")
        presenter.register(email: email, password: password)
        
    }
}

extension RegistrationViewController: RegistrationPresenterOutput {
    func logAlert(error: String) {
        let alert = UIAlertController(title: error, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Повторить", style: .default))
        self.present(alert, animated: true) {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertCanNotLogIn)))
        }
    }
    
    @objc func alertCanNotLogIn() {
        self.dismiss(animated: true, completion: nil)
    }

    
    func redirect() {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.onClose?()
        }
    }
}
