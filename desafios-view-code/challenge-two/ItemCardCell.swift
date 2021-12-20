//
//  ItemCardCell.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 19/12/21.
//

import Foundation
import UIKit
import SnapKit

class ItemCardCell: UITableViewCell {
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = hexStringToUIColor(hex: ColorEnum.lightGray.rawValue)
        return view
    }()
    
    private lazy var content: UIStackView = {
        let view = UIStackView()
        return view
    }()

    open lazy var iconFlagCard: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    open lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.Lato(.bold, size: 16)
        label.textColor = hexStringToUIColor(hex: ColorEnum.darkGray.rawValue)
        label.sizeToFit()
        return label
    }()
    
    open var iconName: String = ""
    open var descriptionTitle: String = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        addViewComponents()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.iconFlagCard.image = UIImage(named: iconName)
        self.descriptionLabel.text = descriptionTitle
        contentView.backgroundColor = .white
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
        
       let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
       contentView.frame = contentView.frame.inset(by: margins)
   }
    
    private func addViewComponents() {
        content.addSubview(iconFlagCard)
        content.addSubview(descriptionLabel)
        container.addSubview(content)
        contentView.addSubview(container)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        content.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().offset(10)
            make.leading.equalToSuperview().inset(10)
        }
        
        iconFlagCard.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(iconFlagCard.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.centerY.equalToSuperview()
        }
    }
}
