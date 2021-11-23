//
//  TableViewCell.swift
//  itasker
//
//  Created by Yashuvaev Naum on 18.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var layout: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layout.layer.borderWidth = 1
        layout.layer.borderColor = UIColor.gray.cgColor
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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
        layout.layer.cornerRadius = 20
//        roundCorners(corners: [.topLeft, .bottomLeft, .bottomRight, .topRight], radius: 10.0)
    }
    
}
