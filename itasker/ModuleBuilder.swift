//
//  ModuleBuilder.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 30.10.2021.
//
import UIKit
import Foundation

protocol Builder  {
    static func createGreetScreen() -> UIViewController
}
 

class ModelBuilder: Builder {
    static func createGreetScreen() -> UIViewController {
        let model = Person(firstName: "123", secondName: "456")
        let view = GreetViewController()
        let presenter = GreetPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
    
    
    // здесь можно собирать второй модуль (такой же статик)

}
