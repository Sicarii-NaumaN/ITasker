//
//  RegistrationViewController.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit

class RegistrationViewController: UIViewController,
                                  UITextFieldDelegate, UITextViewDelegate {
    
    private var labels = RegistrationLabels()
    
    
    override func loadView() {
        super.loadView()
        view = labels
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }


}
