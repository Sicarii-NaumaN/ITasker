//
//  AllCirclesView.swift
//  itasker
//
//  Created by Данил Морозов on 31.10.2021.
//

import UIKit
import EasyPeasy


final class CirclesAndLabel: UIView {
    
    private var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.text = "Добро пожаловать в ITasker!"
        return label
    }()
    
    
    private var topLeftCircle: UIView = {
        let topLeftCircle = CoolCircleForDisign()
        topLeftCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        return topLeftCircle
    }()
    
    private var topCentreCircle: UIView = {
        let topCentreCircle = CoolCircleForDisign()
        topCentreCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 224.0/255.0, blue: 127.0/255.0, alpha: 1)
        return topCentreCircle
    }()
    
    private var buttomRightCircle: UIView = {
        let buttomRightCircle = CoolCircleForDisign()
        buttomRightCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        return buttomRightCircle
    }()
    
    private var buttomLeftCircle: UIView = {
        let buttomRightCircle = CoolCircleForDisign()
        buttomRightCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        return buttomRightCircle
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let allSubviews = [
            label,
            topLeftCircle,
            topCentreCircle,
            buttomRightCircle,
            buttomLeftCircle
        ]
        
        allSubviews.forEach {
            addSubview($0)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        topLeftCircle.easy.layout(
            Top(),
            Left(-175),
            Size(width * 3/5)
            
        )
        topCentreCircle.easy.layout(
            Top(-width * 2/5),
            Left(5),
            Size(width * 4/5)
        )
        
        label.easy.layout(
            CenterX(),
            CenterY()
        )
        
        buttomRightCircle.easy.layout(
            Right(-250),
            Bottom(),
            Size(width * 4/5)

            
        )
        buttomLeftCircle.easy.layout(
            Left(-200),
            Bottom(-200),
            Size(width * 4/5)

        )
    }
    
}
