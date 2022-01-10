//
//  MainMenu.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 19/12/21.
//

import Foundation
import UIKit
import SnapKit

class MainMenuViewController: UIViewController {
    private lazy var scrollView = UIScrollView()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: GeneralColorEnum.teal.rawValue)
        return view
    }()
    
    private lazy var content: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.axis = .vertical
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.init(named: GeneralColorEnum.teal.rawValue)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.indicatorStyle = .default
        tv.register(ItemMenuCell.self, forCellReuseIdentifier: self.cellId)
        return tv
    }()
    
    private let cellId = "cellId"
    
    private let listItemsMenu = Array<ItemMenu>(arrayLiteral:
                                                ItemMenu(
                                                    titleItem: "Mussum Ipsum",
                                                    controller: MussumIpsumViewController(),
                                                    txtColor: GeneralColorEnum.darkGray.rawValue,
                                                    bgColor: GeneralColorEnum.teal100.rawValue
                                                ),
                                                ItemMenu(
                                                    titleItem: "Pagamento com Cartão de Crédito",
                                                    controller: PaymentListCardViewController(),
                                                    txtColor: GeneralColorEnum.darkGray.rawValue,
                                                    bgColor: GeneralColorEnum.teal200.rawValue
                                                )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu Principal"
        view.backgroundColor = .red
    }
    
    override func loadView() {
        super.loadView()
        addViewComponents()
        setupConstraints()
    }
    
    private func addViewComponents() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    private func openMenuItem(_ controller: UIViewController) {
        let screen = controller
        screen.modalPresentationStyle = .overCurrentContext
        self.present(screen, animated: true)
    }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = ChallengeTwoString.challTwoTitleHeader.rawValue
        label.font = UIFont.Lato(.bold, size: 20)
        label.textAlignment = .center
        label.textColor = hexStringToUIColor(hex: GeneralColorEnum.darkGray.rawValue)
        headerView.addSubview(label)
        
        headerView.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(0)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension + 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ChallengeTwoString.challTwoTitleHeader.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemsMenu.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemMenuCell
        cell.titleItem.textColor = hexStringToUIColor(hex: listItemsMenu[indexPath.row].txtColor)
        cell.titleItem.text = listItemsMenu[indexPath.row].titleItem
        cell.retangle.backgroundColor = hexStringToUIColor(hex: listItemsMenu[indexPath.row].bgColor)
        cell.triangle.bgColor = hexStringToUIColor(hex: listItemsMenu[indexPath.row].bgColor)
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = tableView.indexPathForSelectedRow else { return }
        print("LOG >> Item: \(listItemsMenu[item.row].titleItem)")
        
        openMenuItem(listItemsMenu[item.row].controller)
    }
}
