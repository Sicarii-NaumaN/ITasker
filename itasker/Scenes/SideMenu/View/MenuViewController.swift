//
//  MenuViewController.swift
//  itasker
//
//  Created by Данил Морозов on 25.11.2021.
//

import UIKit
import EasyPeasy

final class MenuCell: UITableViewCell {
    static let identifier = "MenuCell"
    
    private let cellImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with option: String) {
        cellImageView.image = UIImage(named: option)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    private func setLayout() {
        let imageWidth = UIScreen.main.bounds.width / 6 - 20
        cellImageView.frame = CGRect(x: 10, y: contentView.height/2 - imageWidth/2, width: imageWidth, height: imageWidth)
    }
    func changeCellColour() {
        self.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    }
    
}


class MenuViewController: UIViewController {
    
    private var selected = IndexPath(row: -1, section: 0)
    
    enum MenuOptions: String, CaseIterable {
        case plus = "1"
        case home = "2"
        case study = "3"
        case portfel = "4"
        case group = "5"
        case all = "6"
        
        var imageName: String {
            switch self {
            case .home:
                return "home1"
            case .study:
                return "study1"
            case .portfel:
                return "portfel1"
            case .group:
                return "group1"
            case .plus:
                return "plus1"
            case .all:
                return "all1"
            }
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 0.1489986479, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.1489986479, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
        tableView.isScrollEnabled = false
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.bounds.size.width / 6,
            height: view.bounds.size.height
        )
    }

}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let division = tableView.height / 7
        return division
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = UITableViewCell()
            cell.backgroundColor = #colorLiteral(red: 0.1489986479, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return UITableViewCell() }
                print(MenuOptions.allCases[indexPath.row-1].imageName)
        cell.configure(with: MenuOptions.allCases[indexPath.row-1].imageName)
        cell.backgroundColor = #colorLiteral(red: 0.1489986479, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
        if selected == indexPath {
            cell.backgroundColor = .darkGray
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        print("Вот такая хуета\(indexPath)")
        selected = indexPath
        tableView.reloadData()
    }
    
    
}

