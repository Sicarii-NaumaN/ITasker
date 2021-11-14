//
//  ButtomBlock.swift
//  itasker
//
//  Created by Данил Морозов on 01.11.2021.
//

import UIKit
import EasyPeasy

protocol ButtonBlockDelegate: AnyObject {
    func loginButtonTappedDelegate()
    func regButtonTappedDelegate()
}


final class ButtonBlock: UIView {
    
    
    weak var delegate: ButtonBlockDelegate?
    
    
    var regButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.setTitle("Регистрация", for: .normal)
        return button
    }()
    
    var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.setTitle("Авторизация", for: .normal)
        return button
    }()
    
    private lazy var separatingRectangle: UIView = {
        let rectView = UIView()
        rectView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
//        rectView.layer.cornerRadius = 10
        return rectView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureButtons()
        let allSubviews = [
            regButton,
            loginButton,
            separatingRectangle,
        ]
        
        allSubviews.forEach {
            addSubview($0)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureButtons() {
        regButton.frame = CGRect(x: 0, y: 0, width: 270, height: 100)
        regButton.layer.cornerRadius = 20
        regButton.layer.maskedCorners = [.layerMaxXMaxYCorner]
            
        
        loginButton.frame = CGRect(x: 0, y: 0, width: 270, height: 100)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.maskedCorners = [.layerMaxXMinYCorner]
    }
    
    private func setupLayout() {
        loginButton.easy.layout(
            Top(0),
            Left(0),
            Width(self.width),
            Height(45)
        )
        separatingRectangle.easy.layout(
            Top(0).to(loginButton),
            CenterX().to(loginButton),
            Width(self.width),
            Height(3)
        )
        regButton.easy.layout(
            Top().to(separatingRectangle),
            CenterX().to(loginButton),
            Height(45),
            Width()
                .like(loginButton)
        )
        
    }
}
