//
//  CreateTaskPresent.swift
//  itasker
//
//  Created by Kristina on 31.10.2021.
//

import UIKit

protocol CreateTaskPresenterProtocol {
    func showCreateTaskVC(_ root: UIViewController)
}

final class CreateTaskPresenter: CreateTaskPresenterProtocol {
    
    func showCreateTaskVC(_ root: UIViewController) {
        //root.navigationController?.present(CreateTaskViewControler(), animated: true)
    }
}
