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

class CreateCategoryViewController: UIViewController, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIColorPickerViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIDocumentPickerDelegate {
  
    
    var presenter: CreateCategoryPresenter
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    
    var pickerIcon = UIPickerView()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //let datePicker = UIDatePicker()
    
    var pickerData:[String] = ["person.fill", "bubble.left.fill", "highlighter", "books.vertical.fill", "graduationcap.fill", "person.2.fill", "person.3.fill", "globe.europe.africa.fill", "pawprint.fill", "paintbrush.pointed.fill", "briefcase.fill", "cart.fill", "giftcard.fill", "banknote.fill", "heart.fill", "cross.case.fill", "envelope.fill", "scroll.fill", "theatermasks.fill", "building.2.fill", "fork.knife", "lightbulb.fill", "car.fill", "display"]
    
    let inputMyButton = InputInitButton(image: "", text: "СОЗДАТЬ КАТЕГОРИЮ", colorForButton: .black, colorForIcon: nil, colorForText: .white)
    let inputBackButton = InputInitButton(image: "arrow.left", text: nil, colorForButton: .clear, colorForIcon: .black, colorForText: nil)
    let inputSettingButton = InputInitButton(image: "trash", text: nil, colorForButton: .clear, colorForIcon: .black, colorForText: nil)
    var picker = UIColorPickerViewController()
    //let alert: AlertViewController
    
    var myButton: UIButtonTextIcon
    var backButton: UIButtonTextIcon
    let settingButton: UIButtonTextIcon
    
    let nameTask = UILabel(frame: .zero)
    let describeTask = UILabel(frame: .zero)
    let myHeader = UILabel()
    
    let imageView = UIImageView(frame: .zero)
    
    var myTextField: TaskTextView
    
    var dataForTable: [String] = ["Цвет", "Иконка"]
    var imageForTable: [String] = ["eyedropper.full", "person.fill"]
    var colorForTable: [UIColor] = [.systemPurple, .systemPurple]
    
    init(presenter: CreateCategoryPresenter) {
        self.presenter = presenter
        nameTask.text = "Название категории"
        
        myTextField = TaskTextView(myText: nameTask, frame: .zero, textContainer: nil)
   
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
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func createIconPicker() {
        pickerIcon.delegate = self
        //pickerIcon.dataSource = self
        let width = 150.0
        pickerIcon.frame = CGRect(x: Int(screenWidth - width)/2, y: 520, width: Int(width), height: 160)
        //pickerIcon.center = self.view.center
        self.view.addSubview(pickerIcon)
        pickerIcon.reloadAllComponents()
        //present(pickerIcon, animated: true, completion: nil)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        createIconPicker()
        myHeader.adjustsFontSizeToFitWidth = true
        myHeader.numberOfLines = 2
        
        myHeader.textAlignment = .left
        myHeader.text = """
Создать категорию
"""
        
        myHeader.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)

        
        tableView.register(CreateCategoryTableViewCell.nib, forCellReuseIdentifier: CreateCategoryTableViewCell.identifire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        
        imageView.image = UIImage(systemName: "square.and.pencil")
        imageView.tintColor = .systemGray
        
        
        backButton.configureButton()
        
        myButton.configureButton()
        
        settingButton.configureButton()
        //settingButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
        
        self.view.addSubview(myTextField)
        self.view.addSubview(backButton)
        self.view.addSubview(myHeader)
        self.view.addSubview(settingButton)
        self.view.addSubview(imageView)
        self.view.addSubview(myButton)
        
        myTextField.configure(frame: CGRect(
            x: 75,
            y: 230,
            width: screenWidth - 115,
            height: 40)
        )
        
        myButton.layer.cornerRadius = 2
        view.backgroundColor = .systemBackground
        setupLayout()
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            dismiss(animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorForTable[0] = viewController.selectedColor
        colorForTable[1] = viewController.selectedColor
        tableView.reloadData()
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
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateCategoryTableViewCell.identifire, for: indexPath) as? CreateCategoryTableViewCell else {
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
            tableView.reloadData()
        }
    }
    
    @IBAction func handleDeleteBtn(sender: UIButtonTextIcon) {
        let alert = UIAlertController(title: "Удалить категорию?", message: nil, preferredStyle: .alert)
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
    
    
    private func setupLayout() {
        imageView.easy.layout(
            Top(40).to(myHeader),
            Right(10).to(myTextField),
            Width(25),
            Height(23)
        )
        
        myHeader.easy.layout(
            Top(120),
            CenterX(10),
            Height(80),
            Width(300)
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
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 90
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
        }
        
        // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        myImageView.tintColor = colorForTable[1]
        myImageView.image = UIImage(systemName: pickerData[row])
        myImageView.contentMode = .scaleAspectFit
        return myImageView
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageForTable[1] = pickerData[row]
        tableView.reloadData()
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
