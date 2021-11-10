//
//  CreateTaskViewController.swift
//  itasker
//
//  Created by Kristina on 31.10.2021.
//


import UIKit
import UITextView_Placeholder

class CreateTaskViewControler: UIViewController {
    
    var presenter: CreateTaskPresenter
    
    private var myButton = UIButtonTextIcon(image: "", text: "СОЗДАТЬ ЗАДАЧУ", colorForButton: .black, colorForIcon: .white)
    
    
    //var textView = UIText(text: "Описание", frame: .zero, textContainer: nil)
    
    
    
    var myTextField = UIText(text: "Имя задачи", frame: .zero, textContainer: nil)
    let myTextField_description = UIText(text: "Описание...", frame: .zero, textContainer: nil)
    
    init(presenter: CreateTaskPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //let textView = UITextView()
        //textView.placeholder = "Описание..."
        //textView.placeholderColor = UIColor.lightGray // optional

        
        
        
        let backButton = UIButtonTextIcon(image: "arrow.left", text: nil, colorForButton: .white, colorForIcon: .black)
        let settingButton = UIButtonTextIcon(image: "ellipsis", text: nil, colorForButton: .white, colorForIcon: .black)
        
        let myHeader = UILabel()
        myHeader.text = "Создать задачу"
        myHeader.frame = CGRect(x: 80, y: 120, width: 300, height: 50)
        myHeader.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        //myHeader.font = UIFont.systemFont(ofSize: 30)
        
        
        let imageView_describe = UIImageView(frame: .zero)
        
        let icon_describe = UIImage(systemName: "text.justify")
        imageView_describe.image = icon_describe
        imageView_describe.tintColor = .systemGray
        self.view.addSubview(imageView_describe)
        imageView_describe.frame = CGRect(x: 55, y: 279, width: 25, height: 20)
        
        let imageView = UIImageView(frame: .zero)
        
        let icon = UIImage(systemName: "square.and.pencil")
        imageView.image = icon
        imageView.tintColor = .systemGray
        self.view.addSubview(imageView)
        imageView.frame = CGRect(x: 55, y: 227, width: 25, height: 23)
        
        backButton.configureButton()
        backButton.configureIcon()
        
        settingButton.configureButton()
        settingButton.myIcon?.tintColor = .black
        
        myButton.configureButton()
        //myButton.backgroundColor = .green
        //myTextField.center = self.view.center
        
        
        self.view.addSubview(myTextField_description)
        self.view.addSubview(myTextField)
        self.view.addSubview(backButton)
        self.view.addSubview(myHeader)
        self.view.addSubview(settingButton)
        
        settingButton.frame = CGRect(x: 325, y: 68, width: 30, height: 30)
        settingButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
        //settingButton.myIcon?.translatesAutoresizingMaskIntoConstraints = false
        settingButton.myIcon?.frame = CGRect(x: 0, y: 0, width: 25, height: 8)
        backButton.frame = CGRect(x: 50, y: 74, width: 25, height: 20)
        myTextField_description.configure(frame: CGRect(x: 90, y: 270, width: 245, height: 30))
        myTextField.configure(frame: CGRect(x: 90, y: 220, width: 245, height: 30))
        
        self.view.addSubview(myButton)
        
        
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        myButton.translatesAutoresizingMaskIntoConstraints = false

        myButton.layer.cornerRadius = 6
        
        //myButton.view.easy.layout(Center(CGPoint(x: 0, y: 50)))
        
        myButton.frame = CGRect(x: 50, y: 740, width: 300, height: 50)

//        NSLayoutConstraint.activate([
//            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            myButton.widthAnchor.constraint(equalToConstant: 300),
//            myButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
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

