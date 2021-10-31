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
