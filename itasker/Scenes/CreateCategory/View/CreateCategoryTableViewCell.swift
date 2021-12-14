//
//  TableViewCell.swift
//  itasker
//
//  Created by Yashuvaev Naum on 18.11.2021.
//

import UIKit

//protocol DatePickerCell {
//
//    var text: String {get}
//    var dateMode: UIDatePickerMode {get}
//
//    cell.label.text = dataForTable[indexPath.row]
//    cell.icon.image = UIImage(systemName: imageForTable[indexPath.row])
//    cell.icon.tintColor = colorForTable[indexPath.row]
//    cell.layout.backgroundColor = .white
//    cell.fillView.backgroundColor = colorForTable[indexPath.row].withAlphaComponent(0.2)
//    cell.label.font = UIFont.systemFont(ofSize: 18)
//    cell.label.inputView = datePicker
//    datePicker.datePickerMode = .date
//}

class CreateCategoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var layout: UIView!
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var fillView: UIView!
    @IBOutlet weak var icon: UIImageView!
    
    var datePicker: UIDatePicker?
    
    var onDate: ((Date)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layout.layer.borderWidth = 1
        layout.layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        // Initialization code
        fillView.roundCorners(corners: .allCorners, radius: 10)
        label.tintColor = .clear
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        contentView.frame = contentView.frame.inset(by: margins)
//        backView.frame = frame.inset(by: margins)
//        leftView.frame = frame.inset(by: margins)
       
        self.roundCorners(corners: [ .allCorners], radius: 10)
        layout.layer.cornerRadius = 15
//        roundCorners(corners: [.topLeft, .bottomLeft, .bottomRight, .topRight], radius: 10.0)
    }
    
}

//extension TableViewCell {
//    public func configure(with data: DatePickerCell) {
//        onDate = data.onDate
//    }
//}
