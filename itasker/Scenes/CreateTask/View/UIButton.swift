//
//  UIButton.swift
//  iTasker
//
//  Created by Kristina on 28.10.2021.
//

import UIKit

class UIButtonTextIcon: UIButton {
    
    var imageNameButton: String?
    var myIcon: UIImageView?
    var labelButton: UILabel?
    var colorButton: UIColor
    var colorIcon: UIColor
    
    init(image: String?, text: String?, colorForButton: UIColor, colorForIcon: UIColor) {
        
        labelButton = UILabel()
        imageNameButton = image
        labelButton?.text = text
        colorButton = colorForButton
        colorIcon = colorForIcon
        
        //как сделать загругленный шрифт?
        labelButton?.font = UIFont(name: "ui-rounded", size: 17)
        
        if imageNameButton != nil {
            self.myIcon = UIImageView(image: UIImage(systemName: imageNameButton!))
        }
        
        super.init(frame: .zero)
        
        if labelButton != nil {
            self.setTitle(labelButton!.text, for: .normal)
            labelButton!.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.heavy)
            self.addSubview(labelButton!)
        }
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    public func configureButton() {
        self.configuration = .filled()
        self.configuration?.baseBackgroundColor = colorButton
        self.configuration?.baseForegroundColor = colorIcon
        
        labelButton?.center = self.center
        labelButton?.textAlignment = NSTextAlignment.center
        
        self.setTitleColor(.white, for: .normal)
        self.configuration?.imagePadding = 6
        
        if imageNameButton != nil {
            self.addSubview(myIcon!)
        }
    }
    
    func configureIcon() {
        myIcon!.tintColor = colorIcon
        addImageConstrains()
    }
    
    func addImageConstrains(){
        myIcon!.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myIcon!.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            myIcon!.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            myIcon!.widthAnchor.constraint(equalToConstant: 30),
            myIcon!.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

