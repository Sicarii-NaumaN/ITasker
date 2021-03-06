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
    private let userID : String
    
    let isSettingsScreen: Bool
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
    
    let task: Task
    let inputMyButton : InputInitButton
//    let inputBackButton = InputInitButton(image: "arrow.left", text: nil, colorForButton: .clear, colorForIcon: .black, colorForText: nil)
    let inputSettingButton = InputInitButton(image: "trash", text: nil, colorForButton: .clear, colorForIcon: .black, colorForText: nil)
    var picker = DateTimePicker()
    //let alert: AlertViewController
    
    var myButton: UIButtonTextIcon
//    var backButton: UIButtonTextIcon
    let settingButton: UIButtonTextIcon
    
    let nameTask = UILabel(frame: .zero)
    let describeTask = UILabel(frame: .zero)
    let myHeader = UILabel()
    
    let imageViewDescribe = UIImageView(frame: .zero)
    let imageView = UIImageView(frame: .zero)
    
    var myTextField: TaskTextView
    var myTextFieldDescription: TaskTextView
    
    var dataForTable: [String] = ["нояб. 6, 10:00", "Ежедневно", "Категория"]
    var imageForTable: [String] = ["calendar.badge.clock", "arrow.triangle.2.circlepath", "tag"]
    var colorForTable: [UIColor] = [.systemOrange, .systemRed, .systemBlue, .systemPurple]
    
    init(presenter: CreateTaskPresenter, userID: String, isSettings: Bool, task: Task = Task(id: "", title: "", description: "", date: Date(), taskType: "", deadline: Date())) {
        self.userID = userID
        self.presenter = presenter
        isSettingsScreen = isSettings
        self.task = task
        nameTask.text = "Название задачи"
        describeTask.text = "Введите описание"
        myTextField = TaskTextView(myText: nameTask, textinput: "", frame: .zero, textContainer: nil)
        myTextFieldDescription = TaskTextView(myText: describeTask, textinput: "",frame: .zero, textContainer: nil)
        
        if !isSettingsScreen {
            
            inputMyButton = InputInitButton(image: "", text: "СОЗДАТЬ ЗАДАЧУ", colorForButton: .black, colorForIcon: nil, colorForText: .white)
        } else {
            inputMyButton = InputInitButton(image: "", text: "СОХРАНИТЬ", colorForButton: .black, colorForIcon: nil, colorForText: .white)
            myTextFieldDescription.text = task.description
            myTextField.text = task.title
//            nameTask.text = task.title
//            describeTask.text = task.description
        }
        
        
        myButton = UIButtonTextIcon.create(input: inputMyButton)
//        backButton = UIButtonTextIcon.create(input: inputBackButton)
        
        settingButton = UIButtonTextIcon.create(input: inputSettingButton)
        
        super.init(nibName: nil, bundle: nil)
        //alert.init()
    
            
        settingButton.addTarget(self, action: #selector(handleDeleteBtn), for: .touchUpInside)
        
        myButton.addTarget(self, action: #selector(handleCreateTask), for: .touchUpInside)
        
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
        picker.frame = CGRect(x: 0, y: -65, width: screenWidth, height:
                                screenHeight)
        picker.dateFormat = "LLL d, HH:mm"
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
        self.hideKeyboardWhenTappedAround()
        if !isSettingsScreen {
            myHeader.text = "Создать задачу"
        } else {
            myHeader.text = "Редактировать"
        }
       
        myHeader.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifire)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        
        
        imageView.image = UIImage(systemName: "square.and.pencil")
        imageView.tintColor = .systemGray
        
        imageViewDescribe.image = UIImage(systemName: "text.justify")
        imageViewDescribe.tintColor = .systemGray
        
//        backButton.configureButton()
        
        myButton.configureButton()
        
        settingButton.configureButton()
        //settingButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
        
        
        self.view.addSubview(myTextField)
        self.view.addSubview(myTextFieldDescription)
//        self.view.addSubview(backButton)
        self.view.addSubview(myHeader)
        if isSettingsScreen {
        self.view.addSubview(settingButton)
        }
        self.view.addSubview(imageViewDescribe)
        self.view.addSubview(imageView)
        self.view.addSubview(myButton)
        //self.view.addSubview(picker)
        
        myTextFieldDescription.configure(frame: CGRect(
            x: 70,
            y: 236,
            width: screenWidth - 130,
            height: 100)
        )
        myTextField.configure(frame: CGRect(
            x: 70,
            y: 185,
            width: screenWidth - 130,
            height: 33)
        )
        
//        myTextFieldDescription.attribute()
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
    
    func updateRepeatLabelCategory(action: UIAlertAction) {
        print(action.title!)
        dataForTable[2] = action.title!
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
        if indexPath == [0, 2] {
            let alert_category = UIAlertController(title: "Выберите категорию", message: nil, preferredStyle: .alert)
            alert_category.addAction(UIAlertAction(title: "Дом", style: .default, handler: updateRepeatLabelCategory))
            alert_category.addAction(UIAlertAction(title: "Семья", style: .default, handler: updateRepeatLabelCategory))
            alert_category.addAction(UIAlertAction(title: "Работа", style: .default, handler: updateRepeatLabelCategory))
            alert_category.addAction(UIAlertAction(title: "Учеба", style: .default, handler: updateRepeatLabelCategory))
            self.present(alert_category, animated: true) {
                alert_category.view.superview?.isUserInteractionEnabled = true
                alert_category.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
            }
        }
    }
    
    @IBAction func handleDeleteBtn(sender: UIButtonTextIcon) {
        let alert = UIAlertController(title: "Удалить задачу?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: self.alertControllerBackgroundTapped))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel))
    
        //alert.view.tintColor = UIColor.systemRed
        self.present(alert, animated: true) {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        }
    }
    
    @IBAction func handleCreateTask(sender: UIButtonTextIcon) {
        let currentDate = Date()
        let taskID: String
        let isNewTask: Bool
        if !isSettingsScreen {
            taskID = String(arc4random())
            isNewTask = true
        } else {
            taskID = self.task.id
            isNewTask = false
        }
        
        var taskType : String
        if dataForTable[2] == "Категория" {
            taskType = self.task.taskType
        } else {
            taskType = dataForTable[2]
        }
        var task = Task(id: taskID, title: self.myTextField.text, description: self.myTextFieldDescription.text, date: currentDate, taskType: taskType, deadline: picker.selectedDate)
        self.presenter.createTask(root: self, task: task, userID: self.userID, isSettings: isNewTask)
    }
    
//    func parseDeadLine(_ deadline: String, _ curDate: Date) -> Date {
//        if deadline.isEmpty {
//            return Date()
//        }
//
//        var items = deadline.components(separatedBy: " ")
//
//        let trimmed = String(items[1].dropLast())
//        items[1] = trimmed
//
//        let date = Date()
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: date)
//        let minutes = calendar.component(.minute, from: date)
//        let year = calendar.component(.year, from: date)
//        let day = calendar.component(.day, from: date)
//
//        cell.deadline.textColor = .gray
//        cell.deadline.font = UIFont.systemFont(ofSize: 15)
//        cell.deadline.text = "\(hour):\(minutes)-\(hour + 1):\(minutes)"
//
//        cell.date.textColor = .gray
//        cell.date.font = UIFont.systemFont(ofSize: 15)
//        cell.date.text = "\(day) \(date.month) \(year)"
//    }
    
    @objc func alertControllerBackgroundTapped(_ :UIAlertAction) -> Void
    {
        self.presenter.deleteTask(root: self, taskID: self.task.id, isSettings: self.isSettingsScreen)
    }
    
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        dataForTable[0] = picker.selectedDateString
        tableView.reloadData()
    }
    
    private func setupLayout() {
        imageView.easy.layout(
            Top(40).to(myHeader),
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
            Top(100),
            CenterX(),
            Height(50),
            Width(230)
        )
        
        myButton.easy.layout(
            Top(screenHeight - 170),
            CenterX(),
            Height(50),
            Width(300)
        )
        
        settingButton.easy.layout(
            Top(60),
            CenterX(135),
            Height(30),
            Width(30)
        )
        
//        backButton.easy.layout(
//            Top(60),
//            Left(50),
//            Height(20),
//            Width(25)
//        )
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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

