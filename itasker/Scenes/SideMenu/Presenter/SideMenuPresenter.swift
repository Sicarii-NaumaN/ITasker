//
//  SideMenuPresenter.swift
//  itasker
//
//  Created by Данил Морозов on 24.11.2021.
//

import UIKit
import Firebase

protocol SideMenuPresenterProtocol {
    func logout()
    func showCreateCategoryVC(_ root: UIViewController)
    func setFilters(filter: String?)
}

final class SideMenuPresenter: SideMenuPresenterProtocol {
    weak var root: ContainerViewController?
    func logout() {
        do {
            
            let presenter = GreetPresenter()
            let controller = GreetViewControler(presenter: presenter)
            presenter.controller = controller
            
//            var window = UIWindow()
//            let navController = UINavigationController(rootViewController: controller)
            
            root?.dismiss(animated: true) { [weak self] in
                guard self != nil else { return }
            }
            root?.navigationController?.present(controller, animated: true)
//            window.rootViewController = navController
//            window.makeKeyAndVisible()
            try FirebaseAuth.Auth.auth().signOut()
            debugPrint("[DEBUG] Logout completed")
            
        }
        catch {
           debugPrint("[ERROR] Error while logout")
        }
    }
    
    func showCreateCategoryVC(_ root: UIViewController) {
        let presenter = CreateCategoryPresenter()
        let vc = CreateCategoryViewController(presenter: presenter)
   
        root.present(vc, animated: true)
    }
    
    func setFilters(filter: String?) {
//        root.
//        let userID : Strin
//        if let userID = FirebaseAuth.Auth.auth().currentUser.uid {
//            userID = "Default"
//        }
//        Manager.shared.getTasks(userID, filter)
    }
}
