//
//  CreateTaskController.swift
//  itasker
//
//  Created by Kristina on 31.10.2021.
//

import UIKit
import UITextView_Placeholder
import EasyPeasy

class CreateTaskControler: UIViewController, CreateTaskPresenterProtocol {
    
    var presenter: CreateTaskPresenter
    
    let inputMyButton = InputInitButton(image: "", text: "СОЗДАТЬ ЗАДАЧУ", colorForButton: .black, colorForIcon: nil, colorForText: .white)
    let inputBackButton = InputInitButton(image: "arrow.left", text: nil, colorForButton: .white, colorForIcon: .black, colorForText: nil)
    let inputSettingButton = InputInitButton(image: "ellipsis", text: nil, colorForButton: .white, colorForIcon: .black, colorForText: nil)
    
    var myButton: UIButtonTextIcon
    var backButton: UIButtonTextIcon
    let settingButton: UIButtonTextIcon
    
    let nameTask = UILabel(frame: .zero)
    let describeTask = UILabel(frame: .zero)
    let myHeader = UILabel()
    
    let imageView_describe = UIImageView(frame: .zero)
    let imageView = UIImageView(frame: .zero)
    
    var myTextField : TaskTextView
    var myTextFieldDescription: TaskTextView
    
    init(presenter: CreateTaskPresenter) {
        self.presenter = presenter
        nameTask.text = "Название задачи"
        describeTask.text = "Введите описание"

         myTextField = TaskTextView(myText: nameTask, frame: .zero, textContainer: nil)
         myTextFieldDescription = TaskTextView(myText: describeTask, frame: .zero, textContainer: nil)
        
        myButton = UIButtonTextIcon.create(input: inputMyButton)
        backButton = UIButtonTextIcon.create(input: inputBackButton)
        settingButton = UIButtonTextIcon.create(input: inputSettingButton)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myHeader.text = "Создать задачу"
        myHeader.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        
        imageView.image = UIImage(systemName: "square.and.pencil")
        imageView.tintColor = .systemGray
        
        imageView_describe.image = UIImage(systemName: "text.justify")
        imageView_describe.tintColor = .systemGray
        
        backButton.configureButton()
        
        myButton.configureButton()
        
        settingButton.configureButton()
        settingButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
        
        myTextFieldDescription.attribute()
        
        view.addSubview(myTextField)
        view.addSubview(myTextFieldDescription)
        view.addSubview(backButton)
        view.addSubview(myHeader)
        view.addSubview(settingButton)
        view.addSubview(imageView_describe)
        view.addSubview(imageView)
        view.addSubview(myButton)
        
        myTextFieldDescription.configure(frame: CGRect(
                                                        x: 90,
                                                        y: 265,
                                                        width: 245,
                                                        height: 100)
                                                    )
        myTextField.configure(frame: CGRect(
                                            x: 90,
                                            y: 220,
                                            width: 245,
                                            height: 30)
                                        )
        
        myButton.layer.cornerRadius = 10
        view.backgroundColor = .systemBackground
        setupLayout()
    }

    private func setupLayout() {
        imageView.easy.layout(
            Top(55).to(myHeader),
            Right(10).to(myTextField),
            Width(25),
            Height(23)
        )
        
        imageView_describe.easy.layout(
            Top(25).to(imageView),
            CenterX(0).to(imageView),
            Width(25),
            Height(20)
        )

        myHeader.easy.layout(
            Top(120),
            CenterX(),
            Height(50),
            Width(230)
        )

        myButton.easy.layout(
            Top(550).to(myHeader),
            CenterX(),
            Height(50),
            Width(300)
        )
        
        settingButton.easy.layout(
            Top(68),
            CenterX(135),
            Height(30),
            Width(30)
        )
        
        backButton.easy.layout(
            Top(74),
            Left(50),
            Height(30),
            Width(30)
        )
    }
}
