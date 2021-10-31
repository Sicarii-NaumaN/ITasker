//
//  LoginView.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit
import EasyPeasy


final class CoolCircleForDisign: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        layer.cornerRadius = layer.bounds.width / 2
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







