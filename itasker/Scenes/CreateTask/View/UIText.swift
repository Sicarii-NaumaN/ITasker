//
//  UIText.swift
//  itasker
//
//  Created by Kristina on 08.11.2021.
//

import UIKit
import EasyPeasy

class UIText: UITextView {
    
    init(myText: UILabel?, frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.placeholder = myText!.text
        self.frame = frame
    }

    required init?(coder: NSCoder) {
        return nil
    }

    func configure(frame: CGRect) {

        self.frame = frame
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.systemGray.cgColor
        self.layer.addSublayer(bottomLine)
        self.font = UIFont.systemFont(ofSize: 17.0)
    }
}
