//
//  greetPresenter.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 30.10.2021.
//

import Foundation


protocol GreetViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol GreetViewPresenterProtocol: AnyObject {
    init(view: GreetViewProtocol, person: Person)
    func showGreeting()
}


class GreetPresenter: GreetViewPresenterProtocol {
    let view: GreetViewProtocol
    let person: Person
    
    required init(view: GreetViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Дарова, " + self.person.firstName + "!"
        self.view.setGreeting(greeting: greeting)
    }
    
    
}
