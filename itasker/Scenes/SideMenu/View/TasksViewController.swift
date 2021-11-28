//
//  HomeViewController.swift
//  itasker
//
//  Created by Данил Морозов on 25.11.2021.
//

import UIKit

protocol TasksViewControllerDelegate: AnyObject {
}

class TasksViewController: UIViewController {

    weak var delegate: TasksViewControllerDelegate?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Все задачи"
        navigationController?.navigationBar.barTintColor = .black
    }
}
