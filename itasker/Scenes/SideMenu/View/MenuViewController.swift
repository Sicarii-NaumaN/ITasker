//
//  MenuViewController.swift
//  itasker
//
//  Created by Данил Морозов on 25.11.2021.
//

import UIKit
import EasyPeasy
import Firebase

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
        let imageWidth = UIScreen.main.bounds.width / 7
        cellImageView.frame = CGRect(x: 12, y: contentView.height/2 - imageWidth/2, width: imageWidth, height: imageWidth)
    }
    func changeCellColour() {
        self.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    }
    
}


class MenuViewController: UIViewController {
    
    private var selected = IndexPath(row: -1, section: 0)
    var presenter: SideMenuPresenter
    var delegate: TicketsViewController?
    init(presenter: SideMenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum MenuOptions: String, CaseIterable {
        case all = "6"
        case home = "2"
        case study = "3"
        case portfel = "4"
        case group = "5"
        case allTasks = "10"
        case plus = "1"
        
        var imageName: String {
            switch self {
            case .all:
                return "all1"
            case .study:
                return "study1"
            case .portfel:
                return "portfel1"
            case .group:
                return "group1"
            case .plus:
                return "plus1"
            case .home:
                return "home1"
            case .allTasks:
                return "alltasks"
            }
        }
    }
    
    
    enum ChoosedMenuOptions: String, CaseIterable {
        case all = "6"
        case home = "2"
        case study = "3"
        case portfel = "4"
        case group = "5"
        case allTasks = "10"
        case plus = "1"
        
        var imageName: String {
            switch self {
            case .all:
                return "all1"
            case .study:
                return "study2"
            case .portfel:
                return "portfel2"
            case .group:
                return "group2"
            case .plus:
                return "plus1"
            case .home:
                return "home2"
            case .allTasks:
                return "alltasks2"
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
//        tableView.selectRow(at: .init(row: 6, section: 0), animated: true, scrollPosition: .bottom)
        
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
        let division = tableView.height / 10
        return division
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = UITableViewCell()
            cell.backgroundColor = #colorLiteral(red: 0.1489986479, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return UITableViewCell() }
//                print(MenuOptions.allCases[indexPath.row-1].imageName)
        cell.configure(with: MenuOptions.allCases[indexPath.row-1].imageName)
        cell.backgroundColor = #colorLiteral(red: 0.1489986479, green: 0.1490316391, blue: 0.1489965916, alpha: 1)
        if selected == indexPath {
            cell.backgroundColor = .darkGray
            cell.configure(with: ChoosedMenuOptions.allCases[indexPath.row-1].imageName)
        }
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
        
        selected = indexPath
        if selected == [0,1] {
            debugPrint("[DEBUG] Logout tapped")
            debugPrint("[DEBUG] Logout for user \(String(describing: FirebaseAuth.Auth.auth().currentUser))")
            self.presenter.logout()
            debugPrint("[DEBUG] Logout for user \(String(describing: FirebaseAuth.Auth.auth().currentUser))")
        }  else if selected == [0,2] {
            
            
            delegate?.filter = "Дом"
        } else if selected == [0,3] {
            
            delegate?.filter = "Учеба"
        } else if selected == [0,4] {
            
            delegate?.filter = "Работа"
        } else if selected == [0,5] {
            debugPrint("---------------------------------------")
            delegate?.filter = "Семья"
        } else if selected == [0,6] {
            debugPrint("---------------------------------------")
            delegate?.filter = nil
        } else if selected == [0,7] {
            debugPrint("---------------------------------------")
            self.presenter.showCreateCategoryVC(self)
        }
        tableView.reloadData()
    }
    
    
}

