//
//  CreateTaskViewController.swift
//  itasker
//
//  Created by Kristina on 31.10.2021.
//


import UIKit
import UITextView_Placeholder
import EasyPeasy

class CreateTaskViewController: UIViewController, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource {
    var presenter: CreateTaskPresenter
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let inputMyButton = InputInitButton(image: "", text: "СОЗДАТЬ ЗАДАЧУ", colorForButton: .black, colorForIcon: nil, colorForText: .white)
    let inputBackButton = InputInitButton(image: "arrow.left", text: nil, colorForButton: .white, colorForIcon: .black, colorForText: nil)
    let inputSettingButton = InputInitButton(image: "ellipsis", text: nil, colorForButton: .white, colorForIcon: .black, colorForText: nil)
            
    var myButton: UIButtonTextIcon
    var backButton: UIButtonTextIcon
    let settingButton: UIButtonTextIcon
            
    let nameTask = UILabel(frame: .zero)
    let describeTask = UILabel(frame: .zero)
    let myHeader = UILabel()
            
    let imageViewDescribe = UIImageView(frame: .zero)
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
        
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifire)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        imageView.image = UIImage(systemName: "square.and.pencil")
        imageView.tintColor = .systemGray
        
        imageViewDescribe.image = UIImage(systemName: "text.justify")
        imageViewDescribe.tintColor = .systemGray
        
        backButton.configureButton()
    
        myButton.configureButton()
        
        settingButton.configureButton()
        settingButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
   
        
        self.view.addSubview(myTextField)
        self.view.addSubview(myTextFieldDescription)
        self.view.addSubview(backButton)
        self.view.addSubview(myHeader)
        self.view.addSubview(settingButton)
        self.view.addSubview(imageViewDescribe)
        self.view.addSubview(imageView)
        self.view.addSubview(myButton)
        
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
        
        myTextFieldDescription.attribute()
        myButton.layer.cornerRadius = 10
        view.backgroundColor = .systemBackground
        setupLayout()
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifire, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }

        // TODO choose color depending on task type
        cell.layout.backgroundColor = .red
//        cell.layout.tintColor = UIColor.red
        
        cell.label.font = UIFont.systemFont(ofSize: 18)
        cell.label.text = "Kristina"
        
        return cell
    }
        
    private func setupLayout() {
        imageView.easy.layout(
            Top(55).to(myHeader),
            Right(10).to(myTextField),
            Width(25),
            Height(23)
        )
        
        imageViewDescribe.easy.layout(
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
            Height(20),
            Width(25)
        )
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

