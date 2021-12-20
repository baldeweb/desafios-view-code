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
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.init(named: ColorEnum.lightGray.rawValue)
        tv.delegate = self
        tv.dataSource = self
        tv.register(ItemCardCell.self, forCellReuseIdentifier: self.cellId)
        return tv
    }()
    
    private lazy var buttonAddNewCard: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = hexStringToUIColor(hex: ColorEnum.white.rawValue)
        button.backgroundColor = hexStringToUIColor(hex: ColorEnum.red.rawValue)
        button.setTitle("Adicionar novo cartão", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setTitle("Voltar", for: .normal)
        return button
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
        setupView()
        addViewComponents()
        setupConstraints()
    }
    
    private func setupView() {
        buttonAddNewCard.addTarget(self, action: #selector(actionDialog), for: .touchUpInside)
        buttonBack.addTarget(self, action: #selector(actionDialog), for: .touchUpInside)
    }
    
    private func addViewComponents() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(buttonAddNewCard.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        buttonAddNewCard.snp.makeConstraints { make in
            make.bottom.equalTo(buttonBack.snp.top).inset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        buttonBack.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    @objc func actionDialog() {
        self.dismiss(animated: true)
    }
}

extension PaymentListCardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCards.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemCardCell
        let item = listCards[indexPath.row]
        cell.iconFlagCard.image = UIImage(named: item.icon)
        cell.descriptionLabel.text = item.description
        cell.descriptionTitle = item.description
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = tableView.indexPathForSelectedRow else { return }
        print("LOG >> Item: \(listCards[item.row].description)")
    }
}
