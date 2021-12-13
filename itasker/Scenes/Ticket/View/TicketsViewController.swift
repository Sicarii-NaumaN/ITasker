//
//  TicketsViewController.swift
//  itasker
//
//  Created by Yashuvaev Naum on 14.11.2021.
//

import UIKit
import EasyPeasy
import Firebase

protocol TicketsViewControllerDelegate: AnyObject {
}

class TicketsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Vars
    weak var delegate: TasksViewControllerDelegate?
    private let presenter: TicketPresenter
    @IBOutlet weak var tableView: UITableView!
    
    private let userID : String
    private var userTasks = [Task]()
    private var createTaskButton = UIButtonTextIcon(image: "", text: String.addNewTask, colorForButton: .orange, colorForIcon: .white, colorForText: .white)
    
    let header = UILabel()
    
    private var count = 1
    let imageView_describe = UIImageView(frame: .zero)
    let imageView = UIImageView(frame: .zero)
    
    // Funcs
    init(presenter: TicketPresenter, userID: String) {
        self.presenter = presenter
        self.userID = userID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        if !self.userID.isEmpty {
            self.userTasks = Manager.shared.getTasks(self.userID)
        } else {
//            debugPrint("[ERROR] Can not get tasks for user")
            self.userTasks = Manager.shared.getTasks("default")
        }
        debugPrint("[DEBUG] \(userTasks) \(userTasks.count)")
        
        self.createTaskButton.addTarget(self, action: #selector(addTaskButtonTapped), for: .touchUpInside)
        super.viewDidLoad()
        
       
        tableView.register(TicketsViewCell.nib, forCellReuseIdentifier: TicketsViewCell.identifire)
//        tableView.rowHeight = 135
        
        tableView.delegate = self
        tableView.dataSource = self
        
        createTaskButton.configureButton()
        createTaskButton.layer.cornerRadius = 10
       
        
        header.text = String.headerAllTasks
        header.textAlignment = .center
        header.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        
        self.view.addSubview(createTaskButton)
        self.view.addSubview(header)
        
        view.backgroundColor = .systemBackground
        setupLayout()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Table view data source

//    func tableView(_ tableView: UITableView,
//                   heightForHeaderInSection section: Int) -> CGFloat {
//
//    }
//
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        self.userTasks = Manager.shared.getTasks(userID)
        return userTasks.count
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return .init()
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 40
//    }
//    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TicketsViewCell.identifire, for: indexPath) as? TicketsViewCell else {
            return UITableViewCell()
        }
        cell.taskDescription = userTasks[indexPath.row].description
        cell.taskID = userTasks[indexPath.row].id
        cell.deadlineTimestamp = userTasks[indexPath.row].deadline
        cell.dateTimestamp = userTasks[indexPath.row].date
        cell.leftView.backgroundColor = .orange
        cell.label.text = userTasks[indexPath.row].title
        count += 1
        
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 6
        
        let calendar = Calendar.current
        
        let hourD = calendar.component(.hour, from: userTasks[indexPath.row].deadline)
        let minutesD = calendar.component(.minute, from: userTasks[indexPath.row].deadline)
//        let yearD = calendar.component(.year, from: userTasks[indexPath.row].date)
        let dayD = calendar.component(.day, from: userTasks[indexPath.row].deadline)
        
        let year = calendar.component(.year, from: userTasks[indexPath.row].date)
        let day = calendar.component(.day, from: userTasks[indexPath.row].date)
        
        cell.deadline.textColor = .gray
        cell.deadline.font = UIFont.systemFont(ofSize: 15)
        let minutesDStr : String
        if minutesD < 10 {
            minutesDStr = "0" + String(minutesD)
        } else {
            minutesDStr = String(minutesD)
        }
        cell.deadline.text = "до: \(hourD):\(minutesDStr) \(dayD) \(userTasks[indexPath.row].deadline.month)"
        
        cell.date.textColor = .gray
        cell.date.font = UIFont.systemFont(ofSize: 13)
        cell.date.text = "\(day) \(userTasks[indexPath.row].date.month) \(year)"
        
//        tableView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TicketsViewCell {
            let task = Task(id: cell.taskID, title: cell.label.text!, description: cell.taskDescription, date: cell.dateTimestamp, taskType: "", deadline: cell.deadlineTimestamp)
            presenter.showChangeTaskVC(self, self.userID, task)
        }
    }
    
    @objc func addTaskButtonTapped() {
        self.addTaskButtonTappedDelegate()
    }
    
    
    private func setupLayout() {
        header.easy.layout(
            Top(50),
            CenterX(),
            Height(50),
            Width(230)
        )
        createTaskButton.easy.layout(
            Top(700).to(header),
            CenterX(),
            Height(50),
            Width(300)
        )
    }

}

extension TicketsViewController {
    func addTaskButtonTappedDelegate() {
        presenter.showCreateTaskVC(self, self.userID)
    }
    
}
