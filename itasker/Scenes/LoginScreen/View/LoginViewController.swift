//
//  VIewController.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit

class LoginViewControler: UIViewController {
    
    var presenter: LoginPresenter
    
    private var circle = CoolCircleForDisign(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
    
    private lazy var coolButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("hit me", for: .normal)
        button.setTitle("thanks", for: .highlighted)
        return button
    }()
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(circle)
        view.addSubview(coolButton)
        coolButton.frame = CGRect(x: 200, y: 400, width: 200, height: 50)
        coolButton.addTarget(self, action: #selector(didCoolButtonTapped), for: .touchUpInside)
        coolButton.layer.cornerRadius = 20
        coolButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .systemBackground
        
    }
    
    @objc func didCoolButtonTapped() {
        presenter.showRegistrationVC(self)
    }
    
}
