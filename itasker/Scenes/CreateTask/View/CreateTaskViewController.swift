//
//  CreateTaskViewController.swift
//  itasker
//
//  Created by Kristina on 31.10.2021.
//


import UIKit
import UITextView_Placeholder
import EasyPeasy
import DateTimePicker

class CreateTaskViewController: UIViewController, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource, DateTimePickerDelegate, UITextFieldDelegate {
    var presenter: CreateTaskPresenter
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    //let datePicker = UIDatePicker()
    
    
    let inputMyButton = InputInitButton(image: "", text: "СОЗДАТЬ ЗАДАЧУ", colorForButton: .black, colorForIcon: nil, colorForText: .white)
    let inputBackButton = InputInitButton(image: "arrow.left", text: nil, colorForButton: .clear, colorForIcon: .black, colorForText: nil)
    let inputSettingButton = InputInitButton(image: "trash", text: nil, colorForButton: .clear, colorForIcon: .black, colorForText: nil)
    var picker = DateTimePicker()
    //let alert: AlertViewController
    
    var myButton: UIButtonTextIcon
    var backButton: UIButtonTextIcon
    let settingButton: UIButtonTextIcon
    
    let nameTask = UILabel(frame: .zero)
    let describeTask = UILabel(frame: .zero)
    let myHeader = UILabel()
    
    let imageViewDescribe = UIImageView(frame: .zero)
    let imageView = UIImageView(frame: .zero)
    
    var myTextField: TaskTextView
    var myTextFieldDescription: TaskTextView
    
    var dataForTable: [String] = ["нояб. 6, 10:00", "Ежедневно", "Теги"]
    var imageForTable: [String] = ["calendar.badge.clock", "arrow.triangle.2.circlepath", "tag"]
    var colorForTable: [UIColor] = [.systemOrange, .systemRed, .systemBlue, .systemPurple]
    
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
        //alert.init()
        settingButton.addTarget(self, action: #selector(handleDeleteBtn), for: .touchUpInside)
        
        myTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let str = (textView.text + text)
        if str.count <= 28 {
            return true
        }
        textView.text = str.substring(to: str.index(str.startIndex, offsetBy: 28))
        return false
    }
    
    
    func createPicker() {
        picker = DateTimePicker.create()
        picker.frame = CGRect(x: 0, y: 0, width: screenWidth, height:
                                screenHeight)
        picker.dateFormat = "LLL d, h:mm"
        picker.doneButtonTitle = "Подтвердить"
        picker.locale = Locale(identifier: "ru_RU")
        picker.darkColor = UIColor.black
        picker.highlightColor = UIColor.systemOrange
        picker.isHidden = false
        self.view.addSubview(picker)
        picker.delegate = self
        
        picker.dismissHandler = { [self] in
            picker.removeFromSuperview()
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myHeader.text = "Создать задачу"
        myHeader.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifire)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        
        imageView.image = UIImage(systemName: "square.and.pencil")
        imageView.tintColor = .systemGray
        
        imageViewDescribe.image = UIImage(systemName: "text.justify")
        imageViewDescribe.tintColor = .systemGray
        
        backButton.configureButton()
        
        myButton.configureButton()
        
        settingButton.configureButton()
        //settingButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
        
        
        self.view.addSubview(myTextField)
        self.view.addSubview(myTextFieldDescription)
        self.view.addSubview(backButton)
        self.view.addSubview(myHeader)
        self.view.addSubview(settingButton)
        self.view.addSubview(imageViewDescribe)
        self.view.addSubview(imageView)
        self.view.addSubview(myButton)
        //self.view.addSubview(picker)
        
        myTextFieldDescription.configure(frame: CGRect(
            x: 70,
            y: 265,
            width: screenWidth - 130,
            height: 100)
        )
        myTextField.configure(frame: CGRect(
            x: 70,
            y: 225,
            width: screenWidth - 130,
            height: 33)
        )
        
        myTextFieldDescription.attribute()
        myButton.layer.cornerRadius = 2
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
        
        cell.label.delegate = self
        cell.label.text = dataForTable[indexPath.row]
        cell.icon.image = UIImage(systemName: imageForTable[indexPath.row])
        cell.icon.tintColor = colorForTable[indexPath.row]
        cell.layout.backgroundColor = .clear
        cell.fillView.backgroundColor = colorForTable[indexPath.row].withAlphaComponent(0.2)
        cell.label.font = UIFont.systemFont(ofSize: 18)
        return cell
    }
    
    func updateRepeatLabel(action: UIAlertAction) {
        print(action.title!)
        dataForTable[1] = action.title!
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == [0, 0] {
            createPicker()
        }
        if indexPath == [0, 1] {
            let alert = UIAlertController(title: "Повторять задачу", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ежедневно", style: .default, handler: updateRepeatLabel))
            alert.addAction(UIAlertAction(title: "Еженедельно", style: .default, handler: updateRepeatLabel))
            alert.addAction(UIAlertAction(title: "Ежемесячно", style: .default, handler: updateRepeatLabel))
            alert.addAction(UIAlertAction(title: "Ежегодно", style: .default, handler: updateRepeatLabel))
            alert.addAction(UIAlertAction(title: "Никогда", style: .default, handler: updateRepeatLabel))
            self.present(alert, animated: true) {
                alert.view.superview?.isUserInteractionEnabled = true
                alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
            }
        }
    }
    
    @IBAction func handleDeleteBtn(sender: UIButtonTextIcon) {
        let alert = UIAlertController(title: "Удалить задачу?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .destructive))
        alert.addAction(UIAlertAction(title: "Нет", style: .default))
        //alert.view.tintColor = UIColor.systemRed
        self.present(alert, animated: true) {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        }
    }
    
    @objc func alertControllerBackgroundTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        dataForTable[0] = picker.selectedDateString
        tableView.reloadData()
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
            Top(screenHeight - 120),
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

