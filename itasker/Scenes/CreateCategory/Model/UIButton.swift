//
//  UIButton.swift
//  iTasker
//
//  Created by Kristina on 28.10.2021.
//

import UIKit
import EasyPeasy

struct InputInitButton {
    let image: String?
    let text: String?
    let colorForButton: UIColor
    let colorForIcon: UIColor?
    let colorForText: UIColor?
}

protocol ButtonView: AnyObject {
    static func create(input: InputInitButton) -> UIButtonTextIcon
}

extension UIColor {
    static let titleColor: UIColor = .white
}

class UIButtonTextIcon: UIButton, ButtonView {
    
    struct ConstantsUIButton {
        static let fontSize: CGFloat = 17
        static let nameFont: String = "ui-rounded"
        static let imagePadding: CGFloat = 6
    }
    
    private var myIcon: UIImageView?
    private var labelButton: UILabel?
    private var colorButton: UIColor
    private var colorIcon: UIColor?
    private var colorText: UIColor?
    var imageNameButton: String?
    
    func initButton(nameFont: String = ConstantsUIButton.nameFont,
                    sizeFont: CGFloat = ConstantsUIButton.fontSize) {
        
        if let imageNameButton = imageNameButton {
            myIcon = UIImageView(image: UIImage(systemName: imageNameButton))
        }
        
        if let labelButton = labelButton {
            setTitle(labelButton.text, for: .normal)
            labelButton.font = UIFont.systemFont(ofSize: sizeFont, weight: UIFont.Weight.heavy)
            addSubview(labelButton)
        }
    }
    
    init(image: String?, text: String?, colorForButton: UIColor, colorForIcon: UIColor?, colorForText: UIColor?) {
        labelButton = UILabel()
        imageNameButton = image
        labelButton?.text = text
        colorButton = colorForButton
        if let colorForIcon = colorForIcon {
            colorIcon = colorForIcon
        }
        if let colorForText = colorForText {
            colorText = colorForText
        }
        
        super.init(frame: .zero)
        initButton()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    public func configureButton() {
        configuration = .filled()
        configuration?.baseBackgroundColor = colorButton
        configuration?.baseForegroundColor = colorIcon
        
        labelButton?.center = self.center
        labelButton?.textAlignment = NSTextAlignment.center
        
        setTitleColor(colorText, for: .normal)
        configuration?.imagePadding = ConstantsUIButton.imagePadding
        
        if let myIcon = myIcon {
            addSubview(myIcon)
            configureIcon(myIcon: myIcon)
        }
    }
    
    func configureIcon(myIcon: UIImageView) {
        myIcon.tintColor = colorIcon
        myIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            myIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            myIcon.widthAnchor.constraint(equalToConstant: 25),
            myIcon.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    static func create(input: InputInitButton) -> UIButtonTextIcon {
        return UIButtonTextIcon(image: input.image, text: input.text, colorForButton: input.colorForButton, colorForIcon: input.colorForIcon, colorForText: input.colorForText)
    }
}
