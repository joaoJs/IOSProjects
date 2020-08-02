//
//  SceneDelegate.swift
//  PokeList
//
//  Created by Joao Campos on 8/1/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.windowScene = scene
        
        let nc = UINavigationController()
        let vc = MainViewController()
        nc.pushViewController(vc, animated: true)
        
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
    }


}

