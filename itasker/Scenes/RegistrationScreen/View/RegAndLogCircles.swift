//
//  RegAndLogCircles.swift
//  itasker
//
//  Created by Данил Морозов on 11.11.2021.
//

import UIKit
import EasyPeasy


final class RegAndLogCircles: UIView {
    
    private var topLeftCircle: UIView = {
        let topLeftCircle = CoolCircleForDisign()
        topLeftCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 224.0/255.0, blue: 127.0/255.0, alpha: 1)
        return topLeftCircle
    }()
    
    private var topCentreCircle: UIView = {
        let topCentreCircle = CoolCircleForDisign()
        topCentreCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        return topCentreCircle
    }()
    
    private var topLittleCircle: UIView = {
        let topLeftCircle = CoolCircleForDisign()
        topLeftCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 224.0/255.0, blue: 127.0/255.0, alpha: 1)
        return topLeftCircle
    }()
    
    private var bottomLeftUpCircle: UIView = {
        let topCentreCircle = CoolCircleForDisign()
        topCentreCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        return topCentreCircle
    }()
    
    private var bottomLeftDownCircle: UIView = {
        let topLeftCircle = CoolCircleForDisign()
        topLeftCircle.backgroundColor = UIColor(red: 255.0/255.0, green: 224.0/255.0, blue: 127.0/255.0, alpha: 1)
        return topLeftCircle
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let allSubviews = [
            topLeftCircle,
            topCentreCircle,
            topLittleCircle,
            bottomLeftUpCircle,
            bottomLeftDownCircle
        ]
        
        allSubviews.forEach {
            addSubview($0)
        }
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        topLeftCircle.easy.layout(
            Top(-width * 1/5),
            Left(-100),
            Size(width * 5/6)
        )
        topCentreCircle.easy.layout(
            Top(-width * 1/5),
            Left(width * 1/2),
            Size(width * 3/5)
        )
        
        topLittleCircle.easy.layout(
            Left(-10).to(topLeftCircle),
            Top().to(topCentreCircle),
            Size(width * 1/8)
        )
        
        bottomLeftUpCircle.easy.layout(
            Bottom(width * 1/5),
            Left(-width * 2/5),
            Size(width * 3/5)
        )
        bottomLeftDownCircle.easy.layout(
            Bottom(-width * 1/4),
            Left(-width * 1/6),
            Size(width * 3/5)

        )
    }
    
    
    
    
}
