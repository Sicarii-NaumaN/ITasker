//
//  ViewController.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 30.10.2021.
//

import UIKit

class GreetViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var greetLabel: UILabel!
    
    var presenter: GreetViewPresenterProtocol!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBAction

    @IBAction func didTapButtonAction(_ sender: Any) {
        self.presenter.showGreeting()
        
    }

}

extension GreetViewController: GreetViewProtocol {
    func setGreeting(greeting: String) {
        self.greetLabel.text = greeting
    }
    
    
}

