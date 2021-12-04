//
//  Exitensions.swift
//  itasker(registration)
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit
import CommonCrypto

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
    func sha256() -> String{
            if let stringData = self.data(using: String.Encoding.utf8) {
                return hexStringFromData(input: digest(input: stringData as NSData))
            }
            return ""
    }
    
    private func digest(input : NSData) -> NSData {
            let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
            var hash = [UInt8](repeating: 0, count: digestLength)
            CC_SHA256(input.bytes, UInt32(input.length), &hash)
            return NSData(bytes: hash, length: digestLength)
    }

    private  func hexStringFromData(input: NSData) -> String {
            var bytes = [UInt8](repeating: 0, count: input.length)
            input.getBytes(&bytes, length: input.length)

            var hexString = ""
            for byte in bytes {
                hexString += String(format:"%02x", UInt8(byte))
            }

            return hexString
    }

    
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
