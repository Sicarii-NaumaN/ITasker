//
//  UIText.swift
//  itasker
//
//  Created by Kristina on 08.11.2021.
//

import UIKit

class UIText: UITextView {

    init(text: String?, frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        //self.placeholder = text
        self.frame = frame
    }

    required init?(coder: NSCoder) {
        return nil
    }

   // var imageView = UIImageView(frame: .zero)
    //let icon = UIImage(systemName: "highlighter")

    func configure(frame: CGRect) {
        
        
        
        self.frame = frame
        self.backgroundColor = .white
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.systemGray.cgColor
        //self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
        self.font = UIFont.systemFont(ofSize: 17.0)
        //icon.image   .imagePadding = 6
        
        //self.borderStyle = UITextField.BorderStyle.roundedRect
        
        
//        self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.textAlignment = .center
//        self.layer.borderColor = UIColor.gray.cgColor
//        self.layer.borderWidth = 1
        //self.layer.cornerRadius = 15

//        self.leftViewMode = .always
//        imageView.image = icon
//        imageView.tintColor = .systemGray
//        self.leftView = imageView
//        self.leftView?.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
    }
}



