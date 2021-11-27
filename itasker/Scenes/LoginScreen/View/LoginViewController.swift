//
//  VIewController.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: GreetPresenter

    let width = UIScreen.main.bounds.width
    let heigth = UIScreen.main.bounds.height
    
    private var labels = LoginLabels()
    
    init(presenter: GreetPresenter) {
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
        
        labels.delegate = self
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc func enterButtonTapped() {
        labels.delegate?.withoutRegButtonTappedDelegate()
    }

}


extension LoginViewController: EnterToAppDelegate {
    func withoutRegButtonTappedDelegate() {
        presenter.showTrickyPassage(self)
    }
    
    
}
