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
        view.backgroundColor = UIColor.init(named: ColorEnum.lightGray.rawValue)
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.axis = .horizontal
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
        label.font = UIFont.Lato(.bold, size: 22)
        label.textColor = UIColor.init(named: ColorEnum.darkGray.rawValue)
        label.sizeToFit()
        return label
    }()
    
    open var iconName: String = ""
    open var descriptionTitle: String = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        addViewComponents()
        setupConstraints()
    }
    
    private func setupView() {
        self.iconFlagCard.image = UIImage(named: iconName)
        self.descriptionLabel.text = descriptionTitle
        contentView.backgroundColor = .white
    }
    
    private func addViewComponents() {
        contentStackView.addArrangedSubview(iconFlagCard)
        contentStackView.addArrangedSubview(descriptionLabel)
        container.addSubview(contentStackView)
        contentView.addSubview(container)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        contentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().offset(10)
            make.leading.equalToSuperview().inset(10)
        }
    }
}
