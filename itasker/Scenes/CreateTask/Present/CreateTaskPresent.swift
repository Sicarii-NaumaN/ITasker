//
//  CreateTaskPresent.swift
//  itasker
//
//  Created by Kristina on 31.10.2021.
//

import UIKit

protocol CreateTaskPresenterProtocol {
    func createTask(root: UIViewController, task: Task, userID: String, isNewTask: Bool)
}

final class CreateTaskPresenter: CreateTaskPresenterProtocol {
    weak var ticketsController: TicketsViewController?
    func createTask(root: UIViewController,  task: Task, userID: String, isNewTask: Bool) {
        debugPrint("[DEBUG] Create task tapped")
        Manager.shared.addTask(task, userID, isNewTask)
        
        ticketsController?.tableView.reloadData()
        
        root.dismiss(animated: true) { [weak self] in
            guard self != nil else { return }
        }
    }
//    func showAlert(_ root: UIViewController) {
//        root.navigationController?.present(AlertViewController(), animated: true)
//    }
}
