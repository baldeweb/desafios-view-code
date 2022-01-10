//
//  ItemOptionsMenu.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 19/12/21.
//

import Foundation
import UIKit
import SnapKit

class ItemMenuCell: UITableViewCell {
    private lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    open lazy var titleItem: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.Lato(.bold, size: 16)
        label.textColor = hexStringToUIColor(hex: GeneralColorEnum.darkGray.rawValue)
        label.sizeToFit()
        return label
    }()
    
    private lazy var contentItem: UIView = {
        let view = UIView()
        return view
    }()
    
    open lazy var retangle: UIView = {
        let view = UIView()
        return view
    }()
    
    open lazy var triangle = UITriangleView(frame: CGRect(x: 10, y: 20, width: 25 , height: 20))
    
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
        makeContentItem()
        self.selectionStyle = .none
        contentView.backgroundColor = .white
    }
    
    private func makeContentItem() {
        makeRetangle()
        makeTriangle()
    }
    
    private func makeRetangle() {
        retangle.layer.cornerRadius = 5
        retangle.layer.masksToBounds = true
    }
    
    private func makeTriangle() {
        triangle.backgroundColor = UIColor(white: 1, alpha: 0)
        triangle.transform = CGAffineTransform(rotationAngle: (90 * CGFloat.pi / 180))
        triangle.layer.cornerRadius = 10
        triangle.layer.masksToBounds = true
    }
    
    private func addViewComponents() {
        retangle.addSubview(titleItem)
        contentItem.addSubview(retangle)
        contentItem.addSubview(triangle)
        container.addSubview(contentItem)
        contentView.addSubview(container)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        contentItem.snp.makeConstraints { make in
            make.top.equalTo(container).offset(5)
            make.bottom.equalTo(container).inset(5)
            make.leading.equalTo(container).offset(20)
            make.trailing.equalTo(container).inset(20)
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(50)
        }
        
        retangle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalTo(triangle.snp.leading).offset(10)
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(150)
        }
        
        triangle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(55)
            make.height.equalTo(retangle)
        }
        
        titleItem.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(50)
        }
    }
}
