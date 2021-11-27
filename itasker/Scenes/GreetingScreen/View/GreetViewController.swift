//
//  VIewController.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit



class GreetViewControler: UIViewController {
    
    var presenter: GreetPresenter
    
    private var circles = CirclesAndLabel()
    
    
    private var buttons: ButtonBlock = {
        let buttons = ButtonBlock(frame: CGRect(x: 0, y: UIScreen.main.bounds.height * 4/6, width: 200, height: 350))
        return buttons
    }()
    
    init(presenter: GreetPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func loadView() {
        super.loadView()
        view = circles
    }
    
    override func viewDidLoad() {
        buttons.withoutLogButton.addTarget(self, action: #selector(withoutRegButtonTapped), for: .touchUpInside)
        buttons.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        buttons.regButton.addTarget(self, action: #selector(regButtonTapped), for: .touchUpInside)
        buttons.delegate = self
        super.viewDidLoad()
        view.addSubview(buttons)
    
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    @objc func withoutRegButtonTapped() {
        buttons.delegate?.withoutRegButtonTappedDelegate()
    }
    
    @objc func loginButtonTapped() {
        buttons.delegate?.loginButtonTappedDelegate()
    }
    
    @objc func regButtonTapped() {
        buttons.delegate?.regButtonTappedDelegate()
    }
}

        
extension GreetViewControler: ButtonBlockDelegate {
    func withoutRegButtonTappedDelegate() {
        presenter.showTrickyPassage(self)
    }
    
    func loginButtonTappedDelegate () {
        presenter.showLoginVC(self)
    }
    
    func regButtonTappedDelegate () {
        presenter.showRegistrationVC(self)
    }
    
    
    
}

extension GreetViewControler: SideButtonDelegate {
    func sideMenuButtonTappedDelegate() {
        presenter.showTrickyPassage(self)
    }
    
}

