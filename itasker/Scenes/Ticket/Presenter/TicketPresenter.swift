//
//  TicketPresenter.swift
//  itasker
//
//  Created by Yashuvaev Naum on 29.11.2021.
//

import UIKit

protocol TicketPresenterProtocol {
    func showCreateTaskVC(_ root: UIViewController)
}

final class TicketPresenter: TicketPresenterProtocol {
    

    func showCreateTaskVC(_ root: UIViewController) {
        let vc = CreateTaskViewController(presenter: CreateTaskPresenter())
        vc.modalPresentationStyle = .fullScreen
        root.navigationController?.present(vc, animated: true)
    }
    
}
