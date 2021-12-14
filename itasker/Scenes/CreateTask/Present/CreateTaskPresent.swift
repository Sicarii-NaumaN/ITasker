//
//  CreateTaskPresent.swift
//  itasker
//
//  Created by Kristina on 31.10.2021.
//

import UIKit

protocol CreateTaskPresenterProtocol {
    func createTask(root: UIViewController, task: Task, userID: String, isSettings: Bool)
    func deleteTask(root: UIViewController, taskID: String, isSettings: Bool)
}

final class CreateTaskPresenter: CreateTaskPresenterProtocol {
    weak var ticketsController: TicketsViewController?
    func createTask(root: UIViewController,  task: Task, userID: String, isSettings: Bool) {
        debugPrint("[DEBUG] Create task tapped")
        Manager.shared.addTask(task, userID, isSettings)
        
        ticketsController?.tableView.reloadData()
        
        root.dismiss(animated: true) { [weak self] in
            guard self != nil else { return }
        }
    }
    
    func deleteTask(root: UIViewController, taskID: String, isSettings: Bool) {
        debugPrint("[DEBUG] Delete task tapped")
        if !isSettings {
            return
        }
        
        Manager.shared.deleteTask(taskID)
        
        ticketsController?.tableView.reloadData()
        
        root.dismiss(animated: true) { [weak self] in
            guard self != nil else { return }
        }
    }
}
