//
//  SceneDelegate.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 02/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowSecene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowSecene)
            
            let vc = MainMenu()
            vc.view.backgroundColor = .white
            window.rootViewController = UINavigationController(rootViewController: vc)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
