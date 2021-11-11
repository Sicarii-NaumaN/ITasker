//
//  LabelsView.swift
//  itasker
//
//  Created by Данил Морозов on 10.11.2021.
//

import UIKit
import EasyPeasy


final class RegistrationLabels: UIView {
    
    private var registrationTitle: UIView = {
        let title = UILabel()
        title.text = "Регистрация"
        return title
    }()
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        return label
    }()
    
    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        return label
    }()
    
    private var userLoginTextField: UITextField = {
        let textField = UITextField(frame: CGRect())
        return textField
    }()
    
    private var userPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect())
        return textField
    }()
    
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let allSubviews = [
            registrationTitle,
            userLoginTextField,
            loginLabel,
            passwordLabel,
            userPasswordTextField
        ]
        
        allSubviews.forEach {
            addSubview($0)
        }
        
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayout()
    }
    
    func setupLayout() {
        
        registrationTitle.easy.layout(
            CenterX(),
            Top(200)
        )
        
        loginLabel.easy.layout(
            Left(self.width * 1/8),
            Top(UIScreen.main.bounds.height * 1/5).to(registrationTitle)
        )
        
        
        userLoginTextField.easy.layout(
            Left(self.width * 1/8),
            Top(20).to(loginLabel),
            Width(self.width * 6/8),
            Height(40)
        )
        
        passwordLabel.easy.layout(
            Left(self.width * 1/8),
            Top(40).to(userLoginTextField)
        )
        
        userPasswordTextField.easy.layout(
            Left(self.width * 1/8),
            Top(20).to(passwordLabel),
            Width(self.width * 6/8),
            Height(40)
        )
    }
}
