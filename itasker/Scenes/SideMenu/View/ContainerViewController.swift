//
//  ContainerViewController.swift
//  itasker
//
//  Created by Данил Морозов on 25.11.2021.
//

import UIKit
import EasyPeasy

protocol SideButtonDelegate: AnyObject {
    func sideMenuButtonTappedDelegate()
}

class ContainerViewController: UIViewController, TasksViewControllerDelegate {
    
    var presenter: SideMenuPresenter
    
    let menuVC = MenuViewController()
    let tasksVC = TicketsViewController(presenter: TicketPresenter())
    var navVC: UINavigationController?
    

    private var eagleCircle: UIView = {
        let buttomRightCircle = CoolCircleForDisign()
        buttomRightCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        return buttomRightCircle
    }()
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1489986479, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
        addChildVCs()
    }
    
    init(presenter: SideMenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func addChildVCs() {
//        //Tasks
//        tasksVC.delegate = self
//        let navVC = UINavigationController(rootViewController: tasksVC)
//        navVC.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        addChild(navVC)
//        view.addSubview(navVC.view)
//        self.navVC = navVC
//        self.navVC?.view.frame = CGRect(x: 0, y: 0, width: self.tasksVC.view.frame.width * 5/6, height: self.tasksVC.view.frame.height)
//      //  self.navVC?.view.frame.origin.x = self.tasksVC.view.frame.width - 370
//
//        // Menu
//        addChild(menuVC)
//        view.addSubview(menuVC.view)
//        self.menuVC.view.frame = CGRect(x: self.tasksVC.view.frame.width * 5 / 6, y: 0, width: self.tasksVC.view.frame.width, height: self.tasksVC.view.frame.height)
//
//        view.addSubview(eagleCircle)
//
//        eagleCircle.easy.layout(
//            Top(-100),
//            Right(-50),
//            Size(self.tasksVC.view.frame.width * 1 / 2)
//
//        )
//    }
    
    private func addChildVCs() {
        //Tasks
        tasksVC.delegate = self
        let navVC = UINavigationController(rootViewController: tasksVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        self.navVC = navVC
        self.navVC?.view.frame = CGRect(x: 0, y: 0, width: self.tasksVC.view.frame.width * 5/6, height: UIScreen.main.bounds.height)
      //  self.navVC?.view.frame.origin.x = self.tasksVC.view.frame.width - 370

        // Menu
        addChild(menuVC)
        view.addSubview(menuVC.view)
        self.menuVC.view.frame = CGRect(x: self.tasksVC.view.frame.width * 5 / 6, y: self.tasksVC.view.frame.height / 6, width: self.tasksVC.view.frame.width, height: self.tasksVC.view.frame.height)

        view.addSubview(eagleCircle)

        eagleCircle.easy.layout(
            Top(-100),
            Right(-50),
            Size(self.tasksVC.view.frame.width * 1 / 2)

        )
    }


}
