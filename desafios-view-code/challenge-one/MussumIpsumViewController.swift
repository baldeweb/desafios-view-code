//
//  MussumIpsumViewController.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 02/12/21.
//

import Foundation
import UIKit
import SnapKit

open class MussumIpsumViewController : UIViewController {
    private lazy var scrollView = UIScrollView()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: GeneralColorEnum.lightGray.rawValue)
        return view
    }()
    
    private lazy var content: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.axis = .vertical
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.Lato(.bold, size: 22)
        label.textColor = hexStringToUIColor(hex: GeneralColorEnum.darkGray.rawValue)
        label.sizeToFit()
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.Lato(.regular, size: 16)
        label.textColor = hexStringToUIColor(hex: GeneralColorEnum.darkGray.rawValue)
        return label
    }()
    
    private lazy var imageCentral: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    private lazy var buttonOpenDialog: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = hexStringToUIColor(hex: GeneralColorEnum.lightGray.rawValue)
        button.backgroundColor = hexStringToUIColor(hex: GeneralColorEnum.orange.rawValue)
        button.setTitle(ChallengeOneString.challOneButtonTitle.rawValue, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addViewComponents()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        titleLabel.text = ChallengeOneString.challOneTitle.rawValue
        descriptionLabel.text = ChallengeOneString.challOneDescription.rawValue
        
        setupImage()
        buttonOpenDialog.addTarget(self, action: #selector(actionDialog), for: .touchUpInside)
    }
    
    @objc func actionDialog() {
        self.dismiss(animated: true)
    }
    
    private func setupImage() {
        imageCentral.image = UIImage(named: ChallengeOneImage.fotoMussum.rawValue)
    }
    
    private func addViewComponents() {
        content.addArrangedSubview(titleLabel)
        content.addArrangedSubview(descriptionLabel)
        content.addArrangedSubview(imageCentral)
        
        scrollView.addSubview(content)
        
        container.addSubview(scrollView)
        container.addSubview(buttonOpenDialog)
        view.addSubview(container)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(22)
            make.leading.equalToSuperview().offset(22)
            make.bottom.equalToSuperview().inset(50)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        content.snp.makeConstraints { make in
            make.top.equalTo(container)
            make.trailing.equalTo(container)
            make.leading.equalTo(container)
            make.bottom.equalTo(buttonOpenDialog.snp.top)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.trailing.equalTo(content)
            make.leading.equalTo(content)
            make.height.greaterThanOrEqualTo(0)
        }
        
        imageCentral.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.trailing.equalTo(content)
            make.leading.equalTo(content)
            make.centerX.equalTo(content)
            make.width.greaterThanOrEqualTo(1)
            make.height.greaterThanOrEqualTo(1)
        }
        
        buttonOpenDialog.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalTo(content)
            make.leading.equalTo(content)
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(50)
        }
    }
    
}
