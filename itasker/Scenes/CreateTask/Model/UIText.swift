//
//  UIText.swift
//  itasker
//
//  Created by Kristina on 08.11.2021.
//

import UIKit
import EasyPeasy

struct ConstantsUIText {
    static let fontSize: CGFloat = 17
}

class TaskTextView: UITextView {
    init(myText: UILabel?, frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        if let myText = myText {
            placeholder = myText.text
        }
        self.frame = frame
    }

    required init?(coder: NSCoder) {
        return nil
    }

    func configure(frame: CGRect) {
        self.frame = frame
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(
                                    x: 0.0,
                                    y: self.frame.height - 1,
                                    width: self.frame.width,
                                    height: 1.0
                                )
        bottomLine.backgroundColor = UIColor.systemGray.cgColor
        layer.addSublayer(bottomLine)
        font = UIFont.systemFont(ofSize: ConstantsUIText.fontSize)
    }
    
    func attribute() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        
        let myAttribute = [ NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.paragraphStyle : style] as [NSAttributedString.Key : Any]
        let myAttrString = NSAttributedString(string:  text, attributes: myAttribute)
        attributedText = myAttrString
    }
}
