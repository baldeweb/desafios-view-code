//
//  ViewController.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 02/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let screen = MussumIpsumViewController()
        screen.modalPresentationStyle = .overCurrentContext
        self.present(screen, animated: false)
    }
}

