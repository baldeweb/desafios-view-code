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
        view.backgroundColor = UIColor.init(named: GeneralColorEnum.lightGray.rawValue)
        return view
    }()
    
    private lazy var navbarContainer = UIView()
    
    open lazy var iconBack: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        return image
    }()
    
    open lazy var titleNavbar: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.Lato(.bold, size: 16)
        label.textColor = hexStringToUIColor(hex: GeneralColorEnum.darkGray.rawValue)
        label.sizeToFit()
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.init(named: GeneralColorEnum.lightGray.rawValue)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.indicatorStyle = .default
        tv.register(ItemCardCell.self, forCellReuseIdentifier: self.cellId)
        return tv
    }()
    
    private lazy var buttonAddNewCard: UIButton = {
        let button = UIButton()
        button.backgroundColor = hexStringToUIColor(hex: GeneralColorEnum.red.rawValue)
        button.titleLabel?.textColor = hexStringToUIColor(hex: GeneralColorEnum.red.rawValue)
        button.setTitle(ChallengeTwoString.challTwoButtonAddNewCard.rawValue, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle(GeneralStringEnum.textBack.rawValue, for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    
    private let cellId = "cellId"
    
    private let listCards = Array<ItemCard>(arrayLiteral:
                                            ItemCard(icon: ChallengeTwoImage.iconMastercard.rawValue, description: "[ CRÉDITO ] - Daycoval "),
                                            ItemCard(icon: ChallengeTwoImage.iconMastercard.rawValue, description: "[ CRÉDITO ] - Santander "),
                                            ItemCard(icon: ChallengeTwoImage.iconMastercard.rawValue, description: "[ DÉBITO ] - Bradesco "),
                                            ItemCard(icon: ChallengeTwoImage.iconMastercard.rawValue, description: "[ DÉBITO ] - Itaú ")
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPanGestureHandleClose()
    }
    
    func setupPanGestureHandleClose() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionDialog))
        iconBack.addGestureRecognizer(tapGesture)
    }
    
    override func loadView() {
        super.loadView()
        setupView()
        addViewComponents()
        setupConstraints()
    }
    
    private func setupView() {
        iconBack.image = UIImage(named: GeneralImageEnum.iconBack.rawValue)
        titleNavbar.text = ChallengeTwoString.challTwoNavbarTitle.rawValue
        
        buttonAddNewCard.addTarget(self, action: #selector(actionDialog), for: .touchUpInside)
        
        buttonBack.addTarget(self, action: #selector(actionDialog), for: .touchUpInside)
    }
    
    private func addViewComponents() {
        navbarContainer.addSubview(iconBack)
        navbarContainer.addSubview(titleNavbar)
        container.addSubview(navbarContainer)
        container.addSubview(tableView)
        container.addSubview(buttonAddNewCard)
        container.addSubview(buttonBack)
        view.addSubview(container)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        navbarContainer.snp.makeConstraints { make in
            make.topMargin.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(50)
        }
        
        iconBack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        titleNavbar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navbarContainer.snp.bottom)
            make.bottomMargin.equalTo(buttonAddNewCard.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        buttonAddNewCard.snp.makeConstraints { make in
            make.bottomMargin.equalTo(buttonBack.snp.top).offset(-10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(50)
        }

        buttonBack.snp.makeConstraints { make in
            make.bottomMargin.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(50)
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
