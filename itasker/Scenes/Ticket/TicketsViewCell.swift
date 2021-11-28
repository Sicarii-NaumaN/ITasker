//
//  TicketsViewCell.swift
//  itasker
//
//  Created by Yashuvaev Naum on 14.11.2021.
//

import UIKit

class TicketsViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var deadline: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var leftView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: .zero, bottom: 0, right: .zero))
//        backView.frame = frame.inset(by: UIEdgeInsets(top: 10, left: .zero, bottom: 0, right: .zero))
//        leftView.frame = backView.frame.inset(by: UIEdgeInsets(top: 0, left: .zero, bottom: 0, right: .zero))
        contentView.frame = contentView.frame.inset(by: margins)
//        backView.frame = frame.inset(by: margins)
//        leftView.frame = frame.inset(by: margins)
       
        self.roundCorners(corners: [ .bottomRight], radius: 10)
        backView.layer.cornerRadius = 20
        leftView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 20)
//        roundCorners(corners: [.topLeft, .bottomLeft, .bottomRight, .topRight], radius: 10.0)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        label.font = UIFont.systemFont(ofSize: 22)
        selectionStyle = .none
//        backView.layer.cornerRadius = 10
    }
}
