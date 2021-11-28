//
//  UITableViewCell + Ext.swift
//  SecretApp
//
//  Created by Владимир Камнев on 08.09.2021.
//

import UIKit

extension UITableViewCell {
    
    static var nib  : UINib{
        return UINib(nibName: identifire, bundle: nil)
    }
    
    static var identifire : String{
        return String(describing: self)
    }
}
