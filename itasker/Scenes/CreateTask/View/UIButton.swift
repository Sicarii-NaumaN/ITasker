//
//  UIButton.swift
//  iTasker
//
//  Created by Kristina on 28.10.2021.
//

import UIKit

class UIButtonTextIcon: UIButton {
    
    //    private struct Constants {
    //        static let buttonWidth: CGFloat = 50
    //        static let buttonHeight: CGFloat = 50
    //        static let buttonRadius: CGFloat = 6
    //    }
    //
    //private let constants: Constants?
    
    //var imageName: String
    var myIcon: UIImageView
    
    init(imageName: String) {
        //self.imageName = "heart.fill"
        self.myIcon = UIImageView(image: UIImage(systemName: "heart.fill"))
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    public func configureButton() {
        print("Button cobfiguration started")
        self.configuration = .filled()
        //myButton.setTitle("I love you", for: .normal)
        //myButton.backgroundColor = .systemPink
        self.configuration?.baseBackgroundColor = .systemPink
        self.configuration?.baseForegroundColor = .green
        
        //myButton.setTitleColor(.white, for: .normal)
        
        
        self.configuration?.imagePadding = 6
        print("Configuration ended")
        
        self.addSubview(myIcon)
        configureIcon(color: .white)
    }
    
    func configureIcon(color: UIColor) {
        myIcon.tintColor = color
        myIcon.tintColor = .white
        addImageConstrains()
    }
    
    func addImageConstrains(){
        myIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            myIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            myIcon.widthAnchor.constraint(equalToConstant: 30),
            myIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

