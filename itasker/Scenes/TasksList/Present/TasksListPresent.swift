//
//  TasksListPresent.swift
//  itasker
//
//  Created by Yashuvaev Naum on 13.11.2021.
//

import UIKit

protocol TasksListPresenterProtocol {
    func showTasksListVC(_ root: UIViewController)
}

final class TasksListPresenter: TasksListPresenterProtocol {
    
    func showTasksListVC(_ root: UIViewController) {
        //root.navigationController?.present(CreateTaskViewControler(), animated: true)
    }
}

