//
//  SceneDelegate.swift
//  Programmatic
//
//  Created by Joao Campos on 7/28/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.windowScene = windowScene
        
        let navVC = UINavigationController()
        let vc = TableViewController()
        navVC.pushViewController(vc, animated: false)
        
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
    }

}

