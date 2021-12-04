//
//  TicketsViewController.swift
//  itasker
//
//  Created by Yashuvaev Naum on 14.11.2021.
//

import UIKit
import EasyPeasy

protocol TicketsViewControllerDelegate: AnyObject {
}

class TicketsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Vars
    weak var delegate: TasksViewControllerDelegate?
    private let presenter: TicketPresenter
    @IBOutlet weak var tableView: UITableView!
    
    private var createTaskButton = UIButtonTextIcon(image: "", text: String.addNewTask, colorForButton: .orange, colorForIcon: .white, colorForText: .white)
    
    let header = UILabel()
    
    private var count = 1
    let imageView_describe = UIImageView(frame: .zero)
    let imageView = UIImageView(frame: .zero)
    
    // Funcs
    init(presenter: TicketPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
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
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TicketsViewCell.identifire, for: indexPath) as? TicketsViewCell else {
            return UITableViewCell()
        }

        // TODO choose color depending on task type
        
        
        cell.leftView.backgroundColor = .orange
        let xNSNumber = count as NSNumber
        cell.label.text = "Label " + xNSNumber.stringValue
        count += 1
        
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 6
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        
        cell.deadline.textColor = .gray
        cell.deadline.font = UIFont.systemFont(ofSize: 15)
        cell.deadline.text = "\(hour):\(minutes)-\(hour + 1):\(minutes)"
        
        cell.date.textColor = .gray
        cell.date.font = UIFont.systemFont(ofSize: 15)
        cell.date.text = "\(day) \(date.month) \(year)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TicketsViewCell {
            cell.label.textColor = .red
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
            Top(630).to(header),
            CenterX(),
            Height(50),
            Width(300)
        )
    }

}

extension TicketsViewController {
    func addTaskButtonTappedDelegate() {
        presenter.showCreateTaskVC(self)
    }
    
}
