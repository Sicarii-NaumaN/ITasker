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
    private var myButton = UIButtonTextIcon(image: "", text: "СОЗДАТЬ ЗАДАЧУ", colorForButton: .black, colorForIcon: .white)
    
    let nameTask = UILabel(frame: .zero)
    
    
    let describeTask = UILabel(frame: .zero)
 
    
    
    let imageView_describe = UIImageView(frame: .zero)
    let imageView = UIImageView(frame: .zero)
    
    let myHeader = UILabel()
    let backButton = UIButtonTextIcon(image: "arrow.left", text: nil, colorForButton: .white, colorForIcon: .black)
    let settingButton = UIButtonTextIcon(image: "ellipsis", text: nil, colorForButton: .white, colorForIcon: .black)
    var myTextField : UIText
    var myTextField_description: UIText
    
    init(presenter: CreateTaskPresenter) {
        self.presenter = presenter
        nameTask.text = "Название задачи"
        describeTask.text = "Введите описание"

         myTextField = UIText(myText: nameTask, frame: .zero, textContainer: nil)
         myTextField_description = UIText(myText: describeTask, frame: .zero, textContainer: nil)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let myAttribute = [ NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.paragraphStyle : style] as [NSAttributedString.Key : Any]
        let myAttrString = NSAttributedString(string: myTextField_description.text, attributes: myAttribute)
        //не понимаю почему не применяются аттрибуты?
        myTextField_description.attributedText = myAttrString

        myHeader.text = "Создать задачу"
        myHeader.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifire)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        imageView.image = UIImage(systemName: "square.and.pencil")
        imageView.tintColor = .systemGray
        
        imageView_describe.image = UIImage(systemName: "text.justify")
        imageView_describe.tintColor = .systemGray
        
        backButton.configureButton()
        backButton.configureIcon()
        
        myButton.configureButton()
        
        settingButton.configureButton()
        settingButton.myIcon?.tintColor = .black
        settingButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
        settingButton.myIcon?.frame = CGRect(x: 0, y: 0, width: 25, height: 8)
        
        self.view.addSubview(myTextField)
        self.view.addSubview(myTextField_description)
        self.view.addSubview(backButton)
        self.view.addSubview(myHeader)
        self.view.addSubview(settingButton)
        self.view.addSubview(imageView_describe)
        self.view.addSubview(imageView)
        self.view.addSubview(myButton)
        
        myTextField_description.configure(frame: CGRect(x: 90, y: 265, width: 245, height: 100))
        myTextField.configure(frame: CGRect(x: 90, y: 220, width: 245, height: 30))
        
        myButton.layer.cornerRadius = 10
        view.backgroundColor = .systemBackground
        setupLayout()

        // Do any additional setup after loading the view.
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
            Height(20),
            Width(25)
        )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
