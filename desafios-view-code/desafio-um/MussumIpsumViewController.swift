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
//    private lazy var scrollView: UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.contentOffset.x = 0
//        scroll.backgroundColor = .green
//        return scroll
//    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: ColorEnum.lightGray.rawValue)
        return view
    }()
    
    private lazy var content: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = hexStringToUIColor(hex: ColorEnum.darkGray.rawValue)
        label.sizeToFit()
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 15)
        label.textColor = hexStringToUIColor(hex: ColorEnum.darkGray.rawValue)
        return label
    }()
    
    private lazy var imageCentral: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var buttonOpenDialog: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = hexStringToUIColor(hex: ColorEnum.lightGray.rawValue)
        button.backgroundColor = hexStringToUIColor(hex: ColorEnum.orange.rawValue)
        button.setTitle("ABRIS O DIALOGIS", for: .normal)
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
        titleLabel.text = "Mussum Ipsum. Cacilds!"
        descriptionLabel.text = "Mussum Ipsum, cacilds vidis litro abertis. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Copo furadis é disculpa de bebadis, arcu quam euismod magna. Quem num gosta di mé, boa gentis num é. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. \n\nQuem num gosta di mim que vai caçá sua turmis! Suco de cevadiss deixa as pessoas mais interessantis. Vehicula non. Ut sed ex eros. Vivamus sit amet nibh non tellus tristique interdum. Não sou faixa preta cumpadi, sou preto inteiris, inteiris."
//        descriptionLabel.text = "Mussum Ipsum, cacilds vidis litro abertis. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Copo furadis é disculpa de bebadis, arcu quam euismod magna. Quem num gosta di mé, boa gentis num é. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. \n\nQuem num gosta di mim que vai caçá sua turmis!"
        
        setupImage()
    }
    
    private func setupImage() {
        imageCentral.image = UIImage(named: "foto_mussum")
        imageCentral.contentMode = .scaleAspectFit
    }
    
    private func addViewComponents() {
        content.addSubview(titleLabel)
        content.addSubview(descriptionLabel)
        content.addSubview(imageCentral)
        
        container.addSubview(content)
        container.addSubview(buttonOpenDialog)
        view.addSubview(container)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalTo(imageCentral.snp.top).offset(0)
            make.trailing.equalTo(content)
            make.leading.equalTo(content)
            make.height.greaterThanOrEqualTo(0)
        }
        
        imageCentral.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(-10)
            make.bottom.equalToSuperview().inset(30)
            make.trailing.equalTo(content)
            make.leading.equalTo(content)
            make.centerX.equalTo(content)
            make.width.greaterThanOrEqualTo(1)
            make.height.greaterThanOrEqualTo(1)
        }
        
//        scrollView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.leading.equalToSuperview()
//            make.bottom.equalTo(buttonOpenDialog)
//            make.height.greaterThanOrEqualTo(0)
//        }
        
        content.snp.makeConstraints { make in
            make.top.equalTo(container).inset(50)
            make.trailing.equalTo(container).inset(26)
            make.leading.equalTo(container).inset(26)
            make.bottom.equalTo(buttonOpenDialog.snp.top).offset(18)
        }
        
        buttonOpenDialog.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.trailing.equalTo(content)
            make.leading.equalTo(content)
            make.width.greaterThanOrEqualTo(0)
            make.height.equalTo(50)
        }
        
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
