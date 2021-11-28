//
//  Exitensions.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit


extension UIView {
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var rigth: CGFloat {
        return frame.maxX
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return frame.maxY
    }
}

extension String {
    public static let addNewTask = "+ ДОБАВИТЬ ЗАДАЧУ"
    
    public static let headerAllTasks = "Все задачи"
    public static let headerFamilyTasks = "Семья"
    public static let headerJobTasks = "Работа"
    public static let headerУduTasks = "Учёба"
}

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "LLL"
        return dateFormatter.string(from: self)
    }
}
  
extension UIViewController {
    var topbarHeight: CGFloat {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        }
}
