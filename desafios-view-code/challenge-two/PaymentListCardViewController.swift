//
//  PaymentListCard.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 19/12/21.
//

import Foundation
import UIKit
import SnapKit

class PaymentListCardViewController: UIViewController {
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: ColorEnum.lightGray.rawValue)
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.init(named: ColorEnum.lightGray.rawValue)
        tv.delegate = self
        tv.dataSource = self
        tv.register(ItemCardCell.self, forCellReuseIdentifier: self.cellId)
        return tv
    }()
    
    private let cellId = "cellId"
    
    private let listCards = Array<ItemCard>(arrayLiteral:
               ItemCard(icon: "iconMastercard", description: "[ CRÉDITO ] - Daycoval "),
                ItemCard(icon: "iconMastercard", description: "[ CRÉDITO ] - Santander "),
                ItemCard(icon: "iconMastercard", description: "[ DÉBITO ] - Bradesco "),
                ItemCard(icon: "iconMastercard", description: "[ DÉBITO ] - Itaú ")
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
}

extension PaymentListCardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCards.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemCardCell
        let item = listCards[indexPath.row]
        cell.iconName = item.icon
        cell.descriptionLabel.text = item.description
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = tableView.indexPathForSelectedRow else { return }
        print("LOG >> Item: \(listCards[item.row].description)")
    }
}
