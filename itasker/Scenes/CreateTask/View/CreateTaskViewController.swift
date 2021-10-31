//
//  CreateTaskViewController.swift
//  itasker
//
//  Created by Kristina on 31.10.2021.
//


import UIKit

class CreateTaskViewControler: UIViewController {
    
    var presenter: CreateTaskPresenter
    
    private var myButton = UIButtonTextIcon(imageName: "heart.fill")
    
    init(presenter: CreateTaskPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.configureButton()
        //myButton.backgroundColor = .green
        self.view.addSubview(myButton)
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        myButton.layer.cornerRadius = 6
        
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.widthAnchor.constraint(equalToConstant: 50),
            myButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


//        NSLayoutConstraint.activate([
//            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            myButton.widthAnchor.constraint(equalToConstant: 50),
//            myButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//  }
//viewWillLayoutSubviews()
//}
//
