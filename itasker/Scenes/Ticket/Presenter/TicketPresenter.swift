//
//  TicketPresenter.swift
//  itasker
//
//  Created by Yashuvaev Naum on 29.11.2021.
//

import UIKit

protocol TicketPresenterProtocol {
    func showCreateTaskVC(_ root: TicketsViewController, _ userID: String)
    func showChangeTaskVC(_ root: UIViewController, _ userID: String, _ task: Task)
}

final class TicketPresenter: TicketPresenterProtocol {
    

    func showCreateTaskVC(_ root: TicketsViewController, _ userID: String) {
        let presenter = CreateTaskPresenter()
        let vc = CreateTaskViewController(presenter: presenter, userID: userID, isSettings: false)
        presenter.ticketsController = root
//        vc.modalPresentationStyle = .fullScreen
        root.navigationController?.present(vc, animated: true)
    }
    
    func showChangeTaskVC(_ root: UIViewController, _ userID: String, _ task: Task) {
        let presenter = CreateTaskPresenter()
        let vc = CreateTaskViewController(presenter: presenter, userID: userID, isSettings: true, task: task)
        presenter.ticketsController = root as? TicketsViewController
        
        root.navigationController?.present(vc, animated: true)
    }
}
