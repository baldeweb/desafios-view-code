//
//  MainMenu.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 19/12/21.
//

import Foundation
import UIKit
import SnapKit

class MainMenu: UIViewController {
    private lazy var scrollView = UIScrollView()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: ColorEnum.lightGray.rawValue)
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
        tv.backgroundColor = .lightGray
        tv.delegate = self
        tv.dataSource = self
        tv.register(ItemMenuCell.self, forCellReuseIdentifier: self.cellId)
        return tv
    }()
    
    private let cellId = "cellId"
    
    private let listItemsMenu = Array<ItemMenu>(arrayLiteral:
                                                    ItemMenu(titleItem: "Mussum Ipsum", controller: MussumIpsumViewController()),
                                                ItemMenu(titleItem: "Mussum Ipsum", controller: MussumIpsumViewController())
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu Principal"
        view.backgroundColor = .white
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
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

extension MainMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemsMenu.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemMenuCell
        cell.titleItem.text = listItemsMenu[indexPath.row].titleItem
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = tableView.indexPathForSelectedRow else { return }
        print("LOG >> Item: \(listItemsMenu[item.row].titleItem)")
        
        openMenuItem(listItemsMenu[item.row].controller)
    }
}
